#Our CLI Controller
class NolanHughesCliApp::CLI

  def call
    puts "Welcome to Breweries Near You!"
    list_breweries
    menu
    goodbye 
  end

  def list_breweries
    puts <<-DOC.gsub /^\s*/, ''
      1. Begyle Brewery
      2. Half Acre Brewing Company
      3. Pipeworks Brewing Company
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      #maybe add name findability
      puts "Enter the number of the brewery you'd like more info on, type list to see all breweries again, or type exit to leave:"
      input = gets.strip.downcase
      case input
      when "list"
        list_breweries
      when "1"
        puts "More info on brewery 1..."
      when "2"
        puts "More info on brewery 2..."
      when "3"
        puts "More info on brewery 3..."
      else
        puts "Not sure what you want. Please type list or exit."
      end
    end
  end

  def goodbye
    puts "Until next time!"
  end
end
