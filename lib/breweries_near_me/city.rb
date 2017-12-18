#make #city_array have all cities
class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def initialize(name)
    @name = name
  end
  #Use all_cities for checking so don't instantiate multiple of same city
  @@all_cities = []

  def self.all
    @@all_cities
  end

  def self.city_instance(city_input)
    all.collect do |city|
      if city.name == city_input.to_s.split(" ").collect { |e| e.capitalize }.join(" ")
        city
      else
        false
      end
    end
  end

  def self.new_city_from_input(city_name)
    city = self.new(city_name.to_s.split(" ").collect { |e| e.capitalize }.join(" "))
    all << city
    binding.pry
  end

  def self.create_breweries
    city_name.breweries = BreweriesNearMe::Brewery.create_breweries(city_name)
  end

end
