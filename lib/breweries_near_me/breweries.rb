class BreweriesNearMe::Brewery
  attr_accessor :name, :location, :description, :hours, :year_established, :beers

  def initialize(name)
    @name = name
  end

  def self.create_breweries(city)
    @all_breweries_in_city = []

    if city.downcase == "chicago"
      brewery_1 = self.new("Begyle Brewery")
      brewery_1.description = "Kicks ass and has CSB!"
      # brewery_1.location = "1800 W Cuyler Ave, Chicago, IL 60613"
      # brewery_1.hours = "12-9pm"
      # brewery_1.year_established = "2012"
      # brewery_1.beers = "1. Free Bird\n 2. Begyle Blonde\n 3. Boat Shoes"
      @all_breweries_in_city << brewery_1
      brewery_2 = self.new("Half Acre Brewing Company")
      @all_breweries_in_city << brewery_2
      brewery_3 = self.new("Pipeworks Brewing Company")
      @all_breweries_in_city << brewery_3
    elsif city.downcase == "fort collins"
      brewery_1 = self.new("Odell Brewery")
      @all_breweries_in_city << brewery_1
      brewery_2 = self.new("New Belgium Brewing")
      @all_breweries_in_city << brewery_2
      brewery_3 = self.new("Snowbank Brewing")
      @all_breweries_in_city << brewery_3
    end
  end

  def all
    @all_breweries_in_city
  end

  def self.print_brewery_names
    @all_breweries_in_city.each.with_index(1) do |brewery, i|
      puts "#{i}. #{brewery.name}"
    end
  end

end
