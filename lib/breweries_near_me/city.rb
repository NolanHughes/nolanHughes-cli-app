class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def initialize(name)
    @name = name
  end

  @@all_cities = []

  def self.all
    @@all_cities
  end

  def self.create_city(city_name)
    city = self.new(city_name.to_s.split(" ").collect { |e| e.capitalize }.join(" "))
    @@all_cities << city
    add_breweries
  end

  def self.add_breweries
    all.each do |city|
      city.breweries = BreweriesNearMe::Brewery.create_breweries(city.name)
    end
  end

end
