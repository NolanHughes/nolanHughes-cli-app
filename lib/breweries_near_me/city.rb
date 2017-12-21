class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def initialize(name)
    @name = name
  end

  @@all_cities = []

  def self.all
    @@all_cities
  end

  def save
    @@all_cities << self
  end

  def add_breweries(breweries)
    self.breweries = breweries
  end

end
