class BreweriesNearMe::Breweries
  attr_accessor :name, :description, :year_established, :id #,:beers, :type :location, :has_taproom

  @@all_breweries_in_city = []

  def initialize(name = nil, description = nil, year_established = nil, id = nil)
    @name = name
    @description = description
    @year_established = year_established
    @id = id
  end

  def self.all
    @@all_breweries_in_city
  end

  def self.new_breweries_from_api(all_breweries_in_city)
    all_breweries_in_city.each do |brewery|
      brewery_1 = self.new(
        brewery["brewery"]["name"],
        brewery["brewery"]["description"],
        brewery["brewery"]["established"],
        brewery["breweryId"]
      )
      #change to #all if it works
      @@all_breweries_in_city << brewery_1
    end
  end

end
