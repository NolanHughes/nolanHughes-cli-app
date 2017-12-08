class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def self.create_cities
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Chicago
    #   2. Fort Collins
    # DOC

    city_1 = self.new
    city_1.name =  "Chicago"
    city_1.breweries = ["Begyle Brewery", "Half Acre Brewing Company", "Pipeworks Brewing Company"]#should get info from breweries class

    city_2 = self.new
    city_2.name =  "Fort Collins"
    city_2.breweries = ["Odell Brewery", "New Belgium Brewing", "Snowbank Brewing"]

    [city_1, city_2]
  end



end
