class BreweriesNearMe::City
  attr_accessor :name, :breweries

  @@all_cities = []

  def self.create_cities

    @city_1 = self.new
    @city_1.name =  "Chicago"
    @@all_cities << @city_1

    @city_2 = self.new
    @city_2.name =  "Fort Collins"
    @@all_cities << @city_2

    add_breweries
  end

  def self.all
    @@all_cities
  end

  def self.add_breweries
    all.each do |city|
      city.breweries = BreweriesNearMe::Brewery.create_breweries(city.name)
    end
  end

end
