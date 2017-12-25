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

      # city = find_or_create_city(city_input)
      city = find_or_scrape_city(city_input)
      binding.pry
      if city != nil
        list_breweries(city)
        brewery_menu(city)
      else
        puts "That doesn't appear to be a city in our database. Please try another city or check for misspellings."
        start
      end
    else
      goodbye
    end
  end

  def find_or_scrape_city(city_input)
    city = BreweriesNearMe::City.all.find { |city| city.name == capitalize(city_input) }
    if city
      city
    else
      BreweriesNearMe::Scraper.new.create_city(city_input)
    end
  end

  def find_or_create_city(input)
    city = BreweriesNearMe::City.all.find { |city| city.name == capitalize(input) }
    if city
      city
    else
      BreweriesNearMe::API.new.create_city(input)
    end
  end

  def list_breweries(city)
    puts ""
    puts "--------------#{city.name} Breweries--------------"
    puts ""

    city.breweries.each.with_index(1) do |brewery, i|
      puts "#{i}. #{brewery.name}"
    end
  end

  def brewery_menu(city)
    brewery_input = nil

    breweries = city.breweries

    if brewery_input != "exit"
      puts "Enter the number of the brewery you'd like more info on, type 'list' to see the breweries again from #{city.name}, 'city' for a different city, or type 'exit'."
      brewery_input = gets.strip.downcase

      last_number = breweries.size

      if brewery_input.to_i > 0 && brewery_input.to_i.between?(1, last_number)
        brewery = breweries[brewery_input.to_i - 1]
        beer_at_brewery = brewery.beer

        print_brewery_details(brewery)
        continue_with_app?(beer_at_brewery, city)
      elsif brewery_input == "list"
        list_breweries(city)
        brewery_menu(city)
      elsif brewery_input == "city"
        start
      elsif brewery_input == "exit"
        goodbye
      else
        puts "Not sure what you want."
        brewery_menu(city)
      end
    end
  end

  def print_brewery_details(brewery)
    puts ""
    puts "--------------#{brewery.name}--------------"
    puts "Description: #{brewery.description}"
    puts "Year Established: #{brewery.year_established}"
    puts "List of Beers:"
    brewery.beer.each.with_index(1) { |beer, i| puts "  #{i}. #{beer.name}" }
    puts ""
  end

  def continue_with_app?(beer_at_brewery, city)
    puts "Would you like to view information about a particular beer, another brewery in #{city.name}, or from a different city?"
    puts "Type 'breweries', 'city', or the number of the beer."
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
      brewery_menu(city)
    end
  end

  def print_beer_details(input, beer_at_brewery)
    beer = beer_at_brewery[input.to_i - 1]
    puts ""
    puts "--------------#{beer.name}--------------"
    puts "Description: #{beer.description}"
    puts "Style: #{beer.style}"
    puts "ABV: #{beer.abv}%"
  end

  def goodbye
    puts "Until next time!"
  end

end
