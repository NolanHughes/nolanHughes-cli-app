#Our CLI Controller
class BreweriesNearMe::CLI

  def call
    puts "Welcome to Breweries Near You!"
    list_and_create_cities
    city_menu
  end

  def list_and_create_cities
    puts "Here's a list of cities to choose from:"
    @cities = BreweriesNearMe::City.create_cities
    @cities.each.with_index(1) do |city, i|
      puts "#{i}. #{city.name}"
    end
  end

  def list_cities
    puts "Here's a list of cities to choose from:"
    @cities.each.with_index(1) do |city, i|
      puts "#{i}. #{city.name}"
    end
  end

  def print_breweries(city)
    puts "Here are the breweries from #{city.split.collect {|word| word.capitalize}.join(" ")}:"
    @brewery_names = BreweriesNearMe::Brewery.print_brewery_names(city)
  end

  def city_menu
    input = nil
    while input != "exit"
      #maybe add number
      #figure out repeated sting
      #figure out how to exit      
      puts "Enter the name of the city where you want to find breweries. You can also type list to see all of the cities again, or type exit to leave:"
      @city_input = gets.strip.downcase
      case @city_input
      when "chicago"
        print_breweries(@city_input)
        brewery_menu
      when "fort collins"
        print_breweries(@city_input)
        brewery_menu
      when "list"
        list_cities
      else
        puts "Not sure what you want. Please type list or exit."
      end
    end
  end

  def brewery_menu
    city_breweries = BreweriesNearMe::City.all.collect do |city|
      if @city_input.split.collect {|word| word.capitalize}.join(" ") == city.name
        city.breweries
      end
    end.compact.flatten

    input = nil
    while input != "exit"
      #maybe add number
      #add exit to city
      #figure out repeated strings
      puts "Enter the name of the brewery you'd like more info on, type list to see all breweries again, or type exit to leave:"
      input = gets.strip.downcase

      city_breweries.each do |brewery|
      if brewery.name.include?(input.split.collect {|word| word.capitalize}.join(" "))
        puts "#{brewery.name}"
        puts "Description: #{brewery.description}"
        puts "Location: #{brewery.location}"
        puts "Hours: #{brewery.hours}"
        puts "Year Established: #{brewery.year_established}"
        puts "Top-Rated Beers: \n#{brewery.beers}"
      elsif input == "list"
        print_breweries(input)
      else
        puts "Not sure what you want. Please type list or exit."
      end
    end
  end
end

  def goodbye
    puts "Until next time!"
  end
end
