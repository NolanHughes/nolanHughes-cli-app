#add list and exit to everything/refactor call method big time.
class BreweriesNearMe::CLI

  def call
    puts "Welcome to Breweries Near You!"
    puts "Please enter the name or zip code of the city where you would like to find breweries."
    @city_input = gets.strip.downcase
    BreweriesNearMe::API.get_brewery_list(@city_input)
    create_city
    create_breweries

    brewery_menu
  end

  def create_city
    city = BreweriesNearMe::City.create_city(@city_input)
  end

  def create_breweries
    breweries = BreweriesNearMe::Brewery.create_breweries(@city_input)
  end

  def print_brewery_details
    brewery = @breweries[@brewery_input.to_i - 1]
    puts "#{brewery.name}"
    puts "Description: #{brewery.description}"
    puts "Location: #{brewery.location}"
    puts "Taproom: #{brewery.has_taproom}"
    puts "Year Established: #{brewery.year_established}"
    puts "Top-Rated Beers: \n#{brewery.beers}"
  end

  def brewery_menu
    @brewery_input = nil

    while @brewery_input != "exit"
      puts "Enter the number of the brewery you'd like more info on:"
      @brewery_input = gets.strip.downcase

      if @brewery_input.to_i > 0
        print_brewery_details
        brewery_menu
      elsif @brewery_input == "list"
        print_breweries
      elsif @brewery_input == "exit"
        list_cities
      else
        puts "Not sure what you want. Please type list or exit."
      end
    end

  end

  def goodbye
    puts "Until next time!"
  end

end

# def list_and_create_cities
#   @cities = BreweriesNearMe::City.create_cities
#   list_cities
# end
#
# def list_cities
#   puts "Here's a list of cities to choose from:"
#   @cities.each.with_index(1) do |city, i|
#     puts "#{i}. #{city.name}"
#   end
# end

# def print_breweries
#   @breweries = @cities[@city_input.to_i - 1].breweries
#   puts "Here are the list of breweries:"
#   @breweries.each.with_index(1) { |brewery, i|puts "#{i}. #{brewery.name}" }
# end

# def city_menu
#   @city_input = nil
#   while @city_input != "exit"
#     puts "Enter the number of the city where you want to find breweries. You can also type list to see all of the cities again, or type exit to leave:"
#     @city_input = gets.strip.downcase
#
#     if @city_input.to_i > 0
#       print_breweries
#       brewery_menu
#     elsif @city_input == "list"
#       list_cities
#     elsif @city_input == "exit"
#       goodbye
#     else
#       puts "Not sure what you want. Please type list or exit."
#     end
#   end
#
# end
