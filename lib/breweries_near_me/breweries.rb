#remove duplicate breweries
class BreweriesNearMe::Breweries
  attr_accessor :name, :description, :year_established, :id, :beer#, :type :location, :has_taproom
  @@all_breweries_in_city = []

  def initialize(name = nil, description = nil, year_established = nil, id = nil, beer = nil)
    @name = name
    @description = description
    @year_established = year_established
    @id = id
    @beer = beer
  end

  def self.all
    @@all_breweries_in_city
  end

  def self.new_breweries_from_api(breweries)

    breweries.each do |brewery|
      #format description
      brewery_1 = self.new(
        brewery["brewery"]["name"],
        brewery["brewery"]["description"],
        brewery["brewery"]["established"],
        brewery["breweryId"]
      )
      @@all_breweries_in_city << brewery_1
    end
    #is it here that I need to clear @@all_breweries_in_city
    all
  end

  def self.add_beers_to_brewery(beers)
    all.each do |brewery|
      if brewery.id == beers.first.brewery_id
        brewery.beer = beers
      end
    end
  end

  def self.add_breweries_to_city(breweries)
    city = BreweriesNearMe::City.city_instance
    city.each { |city| city.breweries = breweries }
  end

end
