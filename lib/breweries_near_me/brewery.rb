class BreweriesNearMe::Brewery
  attr_accessor :name, :id, :avg_beer_rating, :description, :year_established, :beer, :location

  @@all_breweries_in_city = []

  def initialize(name = nil, id = nil, avg_beer_rating = nil, description = nil, year_established = nil, location = nil, beer = nil)
    @name = name
    @id = id
    @avg_beer_rating = avg_beer_rating
    @description = description
    @year_established = year_established
    @beer = beer
    @location = location
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
