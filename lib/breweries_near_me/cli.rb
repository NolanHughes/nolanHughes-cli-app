#Our CLI Controller
require 'pry'
class BreweriesNearMe::CLI

  def call
    puts "Welcome to Breweries Near You!"
    list_cities
    city_menu
  end

  def list_cities
    @cities = BreweriesNearMe::City.create_cities
  end

  def make_and_print_breweries(city)
    puts "Here are the breweries from #{city}"
    @breweries = BreweriesNearMe::Brewery.create_breweries(city)
    @brewery_names = BreweriesNearMe::Brewery.print_breweries
  end

  def city_menu
    input = nil
    if input != "exit"
      #maybe increase name flexability and add number
      puts "What city do you want to find breweries in? You can also type list to see all of the cities again, or type exit to leave:"
      input = gets.strip.downcase
      case input
      when "chicago"
        make_and_print_breweries(input)
        brewery_menu
      when "fort collins"
        make_and_print_breweries(input)
        brewery_menu
      when "list"
        list_cities
      when "exit"
        goodbye
      else
        puts "Not sure what you want. Please type list or exit."
      end
    end
  end

  def brewery_menu
    input = nil
    while input != "exit"
      #maybe increase name flexability and add number
      puts "Enter the name of the brewery you'd like more info on, type list to see all breweries again, or type exit to leave:"
      input = gets.strip.downcase
      case input
      when "list"
        list_breweries
      when "begyle"
        puts "More info on brewery Begyle..."
      when "half acre"
        puts "More info on brewery Half Acre..."
      when "pipeworks"
        puts "More info on brewery Pipeworks..."
      else
        puts "Not sure what you want. Please type list or exit."
      end
    end
  end

  def goodbye
    puts "Until next time!"
  end
end
