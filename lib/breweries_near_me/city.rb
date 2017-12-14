class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def initialize(name)
    @name = name
  end

  @@all_cities = []

  def self.all
    @@all_cities
  end

  def self.new_city_from_input(city_name)
    binding.pry
    city = self.new(city_name.to_s.split(" ").collect { |e| e.capitalize }.join(" "))
  end

  def self.create_breweries
    city_name.breweries = BreweriesNearMe::Brewery.create_breweries(city_name)
  end

end
