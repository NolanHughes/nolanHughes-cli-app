class BreweriesNearMe::Brewery
  attr_accessor :name, :location, :description, :has_taproom, :year_established, :beers, :type

  @@all_breweries = []
  @@all_breweries_in_city = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all_breweries
  end

  def self.all_breweries_in_city
    puts @@all_breweries_in_city
  end

  def self.create_breweries
    # all.each do |brewery|
    #   brewery_1 = self.new(brewery[0]["brewery"]["name"])
    #   brewery_1.description = brewery[0]["brewery"]["description"]
    #   @@all_breweries_in_city << brewery_1
    # end

    if city.downcase == "chicago"
      brewery_1 = self.new("Begyle Brewery")
      brewery_1.type = "Brewery, bar, beer-to-go"
      brewery_1.description = "Kicks ass and has CSB!"
      brewery_1.location = "1800 W Cuyler Ave\nChicago, IL 60613"
      brewery_1.has_taproom = true
      brewery_1.year_established = "2012"
      brewery_1.beers = "1. Free Bird\n2. Begyle Blonde\n3. Boat Shoes"
      @all_breweries_in_city << brewery_1
      brewery_2 = self.new("Half Acre Brewing Company")
      brewery_2.type = "Brewery, bar, beer-to-go, eatery"
      brewery_2.description = "Damn good beer!"
      brewery_2.location = "4257 N. Lincoln Ave\nChicago, Illinois 60618"
      brewery_2.has_taproom = true
      brewery_2.year_established = "2006"
      brewery_2.beers = "1. Daisy Cutter\n2. Tuna\n3. Space"
      @all_breweries_in_city << brewery_2
      brewery_3 = self.new("Pipeworks Brewing Company")
      brewery_2.type = "Brewery"
      brewery_3.description = "Tasty beer and awesome artwork."
      brewery_3.location = "3912 W McLean Ave\nChicago, Illinois 60647"
      brewery_3.has_taproom = false
      brewery_3.year_established = "2009"
      brewery_3.beers = "1. Ninja vs. Unicorn\n2. Lizard King\n3. Blood of the Unicorn"
      @all_breweries_in_city << brewery_3
    elsif city.downcase == "fort collins"
      brewery_1 = self.new("Odell Brewery")
      brewery_1.type = "Brewery, bar, beer-to-go, eatery"
      brewery_1.description = "We love beer. We talk about beer."
      brewery_1.location = "800 East Lincoln Avenue\nFort Collins, Colorado 80524"
      brewery_1.has_taproom = true
      brewery_1.year_established = "1989"
      brewery_1.beers = "1. 90 Shilling\n2. Myrcenary\n3. Drumroll"
      @all_breweries_in_city << brewery_1
      brewery_2 = self.new("New Belgium Brewing")
      brewery_2.type = "Brewery"
      brewery_2.description = "Fat Tire baby!"
      brewery_2.location = "500 Linden Street\nFort Collins, Colorado 80524"
      brewery_2.has_taproom = false
      brewery_2.year_established = "1989"
      brewery_2.beers = "1. Fat Tire\n2. Shift\n3. Ranger"
      @all_breweries_in_city << brewery_2
      brewery_3 = self.new("Snowbank Brewing")
      brewery_1.type = "Brewery, bar, beer-to-go"
      brewery_3.description = "A departure from the traditional, Snowbank Brewing focuses on innovation and a passion for the Colorado lifestyle."
      brewery_3.location = "225 N Lemay Ave\nSuite 1\nFort Collins, Colorado 80524"
      brewery_3.has_taproom = true
      brewery_3.year_established = "2014"
      brewery_3.beers = "1. Colorado Red\n2. Cranknbrew\n3. Ghana Chocolate Stout"
      @all_breweries_in_city << brewery_3
    end
  end

end
