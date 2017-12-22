class BreweriesNearMe::Brewery
  attr_accessor :name, :description, :year_established, :id, :beer, :location, :isClosed

  @@all_breweries_in_city = []

  def initialize(name = nil, description = nil, year_established = nil, id = nil, location = nil, isClosed = nil, beer = nil)
    @name = name
    @description = description
    @year_established = year_established
    @id = id
    @beer = beer
    @location = location
    @isClosed = isClosed
  end

  def self.all
    @@all_breweries_in_city
  end

  def save
    @@all_breweries_in_city << self
  end

  def add_beers(beers)
    self.beer = beers
  end

end
