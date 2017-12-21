class BreweriesNearMe::CLI
  include Helpers

  def call
    puts "Welcome to Breweries Near You!"
    start
  end

  def start
    puts ""
    puts "Please enter the name of the city where you would like to find breweries."

    city_input = gets.strip.downcase

    if city_input != "exit"
      puts "Please wait a few moments. This might take a while depending on how many breweries are in #{capitalize(city_input)}."

      city = find_or_create_city(city_input)
      if !city.breweries.empty?
        list_breweries(city)
        brewery_menu(city)
      end
    else
      goodbye
    end
  end

  def find_or_create_city(input)
    city = BreweriesNearMe::City.all.find { |city| city.name == capitalize(input) }
    city ? city : BreweriesNearMe::API.new.create_city(input)
  end

  def list_breweries(city)
    puts ""
    puts "Here are a list of breweries from #{city.name}:"
    puts ""

    city.breweries.each.with_index(1) { |brewery, i| puts "#{i}. #{brewery.name}" }
  end

  def brewery_menu(city)
    brewery_input = nil

    breweries = city.breweries

    if brewery_input != "exit"
      puts "Enter the number of the brewery you'd like more info on, type list to see the list of breweries again, or type exit."
      brewery_input = gets.strip

      last_number = breweries.size

      if brewery_input.to_i > 0 && brewery_input.to_i.between?(1, last_number)
        brewery = breweries[brewery_input.to_i - 1]
        beer_at_brewery = brewery.beer

        print_brewery_details(brewery)
        continue_with_app?(beer_at_brewery, city)
      elsif brewery_input == "list"
        list_breweries(city)
        brewery_menu(city)
      elsif brewery_input == "exit"
        goodbye
      else
        puts "Not sure what you want. Please type a number listed by the breweries, list, or exit."
        brewery_menu(city)
      end
    end
  end

  def continue_with_app?(beer_at_brewery, city)
    puts "Would you like to view information about a particular beer, another brewery in #{city.name}, or from a different city?"
    puts "Type breweries, city, or the number of the beer."
    input = gets.strip.downcase

    last_number = beer_at_brewery.size

    if input.to_i > 0 && input.to_i.between?(1, last_number)
      print_beer_details(input, beer_at_brewery)
      continue_with_app?(beer_at_brewery, city)
    elsif input == "breweries"
      brewery_menu(city)
    elsif input == "city"
      start
    elsif input == "exit"
      goodbye
    else
      puts "I'm not sure what you want."
      list_breweries(city)
      brewery_menu
    end
  end

  def print_brewery_details(brewery)
    puts ""
    puts "#{brewery.name}"
    puts "Description: #{brewery.description}"
    puts "Year Established: #{brewery.year_established}"
    puts "List of Beers:"
    brewery.beer.each.with_index(1) { |beer, i| puts "  #{i}. #{beer.name}" }
  end

  def print_beer_details(input, beer_at_brewery)
    beer = beer_at_brewery[input.to_i - 1]
    puts ""
    puts beer.name
    puts "Description: #{beer.description}"
    puts "Style: #{beer.style}"
    puts "ABV: #{beer.abv}%"
  end

  def goodbye
    puts "Until next time!"
  end

end
