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
      brewery_1.location = "1800 W Cuyler Ave\nChicago, IL 60613"
      brewery_1.hours = "12-9pm"
      brewery_1.year_established = "2012"
      brewery_1.beers = "1. Free Bird\n2. Begyle Blonde\n3. Boat Shoes"
      @all_breweries_in_city << brewery_1
      brewery_2 = self.new("Half Acre Brewing Company")
      brewery_2.description = "Damn good beer!"
      brewery_2.location = "4257 N. Lincoln Ave\nChicago, Illinois 60618"
      brewery_2.hours = "12-10pm"
      brewery_2.year_established = "2006"
      brewery_2.beers = "1. Daisy Cutter\n2. Tuna\n3. Space"
      @all_breweries_in_city << brewery_2
      brewery_3 = self.new("Pipeworks Brewing Company")
      brewery_3.description = "Tasty beer and awesome artwork."
      brewery_3.location = "3912 W McLean Ave\nChicago, Illinois 60647"
      brewery_3.hours = "Currently no tap room"
      brewery_3.year_established = "2009"
      brewery_3.beers = "1. Ninja vs. Unicorn\n2. Lizard King\n3. Blood of the Unicorn"
      @all_breweries_in_city << brewery_3
    elsif city.downcase == "fort collins"
      brewery_1 = self.new("Odell Brewery")
      brewery_1.description = "We love beer. We talk about beer."
      brewery_1.location = "800 East Lincoln Avenue\nFort Collins, Colorado 80524"
      brewery_1.hours = "11am-6pm"
      brewery_1.year_established = "1989"
      brewery_1.beers = "1. 90 Shilling\n2. Myrcenary\n3. Drumroll"
      @all_breweries_in_city << brewery_1
      brewery_2 = self.new("New Belgium Brewing")
      brewery_2.description = "Fat Tire baby!"
      brewery_2.location = "500 Linden Street\nFort Collins, Colorado 80524"
      brewery_2.hours = "N/A"
      brewery_2.year_established = "1989"
      brewery_2.beers = "1. Fat Tire\n2. Shift\n3. Ranger"
      @all_breweries_in_city << brewery_2
      brewery_3 = self.new("Snowbank Brewing")
      brewery_3.description = "A departure from the traditional, Snowbank Brewing focuses on innovation and a passion for the Colorado lifestyle."
      brewery_3.location = "225 N Lemay Ave\nSuite 1\nFort Collins, Colorado 80524"
      brewery_3.hours = "2pm-8pm"
      brewery_3.year_established = "2014"
      brewery_3.beers = "1. Colorado Red\n2. Cranknbrew\n3. Ghana Chocolate Stout"
      @all_breweries_in_city << brewery_3
    end
  end

  def self.print_brewery_names(city_name)
    BreweriesNearMe::City.all.each do |city|
      if city.name.downcase == city_name
        city.breweries.each.with_index(1) do |brewery, i|
          puts "#{i}. #{brewery.name}"
        end
      end
    end
  end

end
