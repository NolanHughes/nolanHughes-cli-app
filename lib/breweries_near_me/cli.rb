#Our CLI Controller
class BreweriesNearMe::CLI

  def call
    puts "Welcome to Breweries Near You!"
    list_and_create_cities
    city_menu
  end

  def list_and_create_cities
    @cities = BreweriesNearMe::City.create_cities
    list_cities
  end

  def list_cities
    puts "Here's a list of cities to choose from:"
    @cities.each.with_index(1) do |city, i|
      puts "#{i}. #{city.name}"
    end
  end

  def print_breweries
    breweries = @cities[@city_input.to_i - 1].breweries
    puts "Here are the list of breweries:"
    breweries.each.with_index(1) { |brewery, i|puts "#{i}. #{brewery.name}" }
  end

  def city_menu
    @city_input = nil
    while @city_input != "exit"
      puts "Enter the number of the city where you want to find breweries. You can also type list to see all of the cities again, or type exit to leave:"
      @city_input = gets.strip.downcase

      if @city_input.to_i > 0
        print_breweries
        brewery_menu
      elsif @city_input == "list"
        list_cities
      elsif @city_input == "exit"
        goodbye
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
      elsif input == "exit"
        goodbye
      else
        brewery_menu
      end
    end
  end
end

  def goodbye
    puts "Until next time!"
  end
end
