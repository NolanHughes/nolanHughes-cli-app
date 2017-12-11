class BreweriesNearMe::City
  attr_accessor :name, :breweries

  def self.create_city

    @city_1 = self.new
    @city_1.name =  "Chicago"
    #city_1.breweries = ["Begyle Brewery", "Half Acre Brewing Company", "Pipeworks Brewing Company"]#should get info from breweries class

    # @city_2 = self.new
    # @city_2.name =  "Fort Collins"
    # city_2.breweries = ["Odell Brewery", "New Belgium Brewing", "Snowbank Brewing"]

    [@city_1, @city_2]
  end

  def self.add_brewery
    @city_1.breweries = BreweriesNearMe::Brewery.create_breweries(@city_1.name)
    # @city_2.breweries = BreweriesNearMe::Brewery.create_breweries(@city_2.name)
    [@city_1]
  end



end
