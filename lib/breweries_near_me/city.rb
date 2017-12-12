class BreweriesNearMe::City
  attr_accessor :name, :breweries

  @@top_beer_cities= {
    "OR" => "Portland",
    "CA" => "San Diego",
    "CO" => "Denver",
    "WA" => "Seattle",
    "IL" => "Chicago",
    "CA" => "San Francisco",
    "NY" => "NYC",
    "MI" => "Grand Rapids",
    "WI" => "Milwaukee",
    "MN" => "Minneapolis"
}

  @@all_cities = []

  def self.all
    @@all_cities
  end

  def self.create_cities
    self.scrape_cities
    add_breweries
    # [@city_1, @city_2] #leave here? or call all? I think call all. Seems better.
  end

  def self.scrape_cities
    #go to beeradvocate, find the name of the city
    #instantiate a city
    #push city to @@all_cities


    # @city_1 = self.new
    # @city_1.name =  "Chicago"
    # @@all_cities << @city_1
    #
    # @city_2 = self.new
    # @city_2.name =  "Fort Collins"
    # @@all_cities << @city_2
    #
    # [@city_1, @city_2]
  end

  def self.add_breweries
    all.each do |city|
      city.breweries = BreweriesNearMe::Brewery.create_breweries(city.name)
    end
  end

end
