#Our CLI Controller
class NolanHughesCliApp::CLI

  def call
    puts "Welcome to Breweries Near You!"
    list_cities
    city_menu
    # list_breweries
    # brewery_menu
    goodbye
  end

  def list_cities
    @cities = NolanHughesCliApp::City.all
  end

  def list_breweries
    puts "Here are the breweries from that city"
    @breweries = NolanHughesCliApp::Breweries.all

  end

  def city_menu
    input = nil
    while input != "exit"
      #maybe increase name flexability
      puts "What city do you want to find breweries in? You can also type list to see all of the cities again, or type exit to leave:"
      input = gets.strip.downcase
      case input
      when "chicago" || 1
        puts "Chicago Breweries"
      when "fort collins" || 2
        puts "More info on brewery 1..."
      when "san diego" || 3
        puts "More info on brewery 2..."
      when "list"
        list_cities
      else
        puts "Not sure what you want. Please type list or exit."
      end
    end
  end

  def brewery_menu
    input = nil
    while input != "exit"
      #maybe increase name flexability
      puts "Enter the number of the brewery you'd like more info on, type list to see all breweries again, or type exit to leave:"
      input = gets.strip.downcase
      case input
      when "list"
        list_breweries
      when "begyle" || "1"
        puts "More info on brewery Begyle..."
      when "half acre" || "2"
        puts "More info on brewery Half Acre..."
      when "pipeworks" || "3"
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
