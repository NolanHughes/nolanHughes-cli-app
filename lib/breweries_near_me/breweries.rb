class BreweriesNearMe::Breweries
  attr_accessor :name, :description, :year_established, :id, :beer
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
    all.clear
    breweries.each do |brewery|
      brewery_1 = self.new(
        brewery["brewery"]["name"],
        brewery["brewery"]["description"],
        brewery["brewery"]["established"],
        brewery["breweryId"]
      )
      @@all_breweries_in_city << brewery_1
    end
    all.uniq { |brewery| brewery.id }
  end

  def self.add_beers_to_brewery(beers)
    all.each do |brewery|
      if brewery.id == beers.first.brewery_id
        brewery.beer = beers
      end
    end
  end

  def self.add_breweries_to_city(breweries, city_input)
    city = BreweriesNearMe::City.all.find do |city_in_all|
      city_in_all.name == city_input.to_s.split(" ").collect { |e| e.capitalize }.join(" ")
    end
    city.breweries = breweries
  end

end
