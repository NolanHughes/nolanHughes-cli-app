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
    puts "Enter the number or name of the brewery you'd like more info on or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on brewery 1..."
      when "2"
        puts "More info on brewery 2..."
      when "3"
        puts "More info on brewery 3..."
      end
    end
  end

  def goodbye
    puts "Until next time!"
  end
end
