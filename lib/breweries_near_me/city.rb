class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def initialize(name)
    @name = name
  end

  @@city = []

  def self.city_instance
    @@city
  end


  def self.new_city_from_input(city_name)
    city = self.new(city_name.to_s.split(" ").collect { |e| e.capitalize }.join(" "))
    city_instance << city
  end

  def self.create_breweries
    city_name.breweries = BreweriesNearMe::Brewery.create_breweries(city_name)
  end

end
