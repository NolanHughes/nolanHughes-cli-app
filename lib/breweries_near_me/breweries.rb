class BreweriesNearMe::Brewery
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.create_breweries(city)
    @all_breweries_in_city = []

    if city == "chicago"
      @all_breweries_in_city << self.new("Begyle Brewery")
      @all_breweries_in_city << self.new("Half Acre Brewing Company")
      @all_breweries_in_city << self.new("Pipeworks Brewing Company")
    elsif city == "fort collins"
      @all_breweries_in_city << self.new("Odell Brewery")
      @all_breweries_in_city << self.new("New Belgium Brewing")
      @all_breweries_in_city << self.new("Snowbank Brewing")
    end
    @all_breweries_in_city
  end

  def self.print_breweries
    counter = 1
    @all_breweries_in_city.collect do |brewery|
      puts "#{counter}. #{brewery.name}"
      counter += 1
    end
  end

end
