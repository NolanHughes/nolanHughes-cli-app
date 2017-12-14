#Figure out error if city_input does not equal real city
class BreweriesNearMe::CLI

  def call
    puts "Welcome to Breweries Near You!"
    start
  end

  def start
    puts ""
    puts "Please enter the name of the city where you would like to find breweries."

    city_input = gets.strip.downcase

    if city_input != "exit"
      new_city_from_input(city_input)

      brewery_array = BreweriesNearMe::API.get_all_brewery_info(city_input)
      
      new_breweries_from_api(brewery_array)
      list_breweries
      brewery_menu
    else
      goodbye
    end
  end

  def new_city_from_input(city_input)
    BreweriesNearMe::City.new_city_from_input(city_input)
  end

  def new_breweries_from_api(brewery_array)
    @breweries = BreweriesNearMe::Breweries.new_breweries_from_api(brewery_array)
    BreweriesNearMe::Breweries.add_breweries_to_city(@breweries)
  end

  def list_breweries
    @city = BreweriesNearMe::City.city_instance.first

    puts ""
    puts "Here are a list of breweries from #{@city.name}:"
    puts ""

    @city.breweries.each.with_index(1) do |brewery, i|
      puts "#{i}. #{brewery.name}"
    end
  end

  def brewery_menu
    brewery_input = nil

    if brewery_input != "exit"
      puts "Enter the number of the brewery you'd like more info on, type list to see the list of breweries again, or type exit."
      brewery_input = gets.strip

      range = @breweries.size

      if brewery_input.to_i > 0 && brewery_input.to_i.between?(1, range)
        print_brewery_details(brewery_input)
        continue_with_app?
      elsif brewery_input == "list"
        list_breweries
        brewery_menu
      elsif brewery_input == "exit"
        goodbye
      else
        puts "Not sure what you want. Please type a number listed by the breweries, list, or exit."
        brewery_menu
      end
    end
  end

  def continue_with_app?
    puts "Would you like to view another brewery in #{@city.name} or from a different city? Type brewery or city."
    input = gets.strip.downcase
    if input == "brewery"
      brewery_menu
    elsif input == "city"
      start
    elsif input == "exit"
      goodbye
    else
      puts "I'm not sure what you want."
      list_breweries
      brewery_menu
    end
  end

  def print_brewery_details(brewery_input)
    BreweriesNearMe::Breweries.print_brewery_details(brewery_input, @breweries)
  end

  def goodbye
    puts "Until next time!"
  end

end
