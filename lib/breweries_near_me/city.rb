class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def initialize(name)
    @name = name
  end

  @@all_cities = []

  def self.all
    @@all_cities
  end

  def self.new_city_from_api(city_name)
    @city = self.new(city_name.to_s.split(" ").collect { |e| e.capitalize }.join(" "))
    # breweries = BreweriesNearMe::API.get_breweries(city_name)
    create_breweries
    @@all_cities << @city
  end

  def self.create_breweries
    @city.breweries = BreweriesNearMe::Brewery.create_breweries
  end

end
