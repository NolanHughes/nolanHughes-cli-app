class NolanHughesCliApp::City

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
      1. Chicago
      2. Fort Collins
      3. San Diego
    DOC

    city_1 = self.new
    city_1.name =  "Chicago"
    city_1.breweries = ["Begyle Brewery", "Half Acre Brewing Company", "Pipeworks Brewing Company"]

    city_2 = self.new
    city_2.name =  "Fort Collins"
    city_2.breweries = ["Odell Brewery", "New Belgium Brewing", "Snowbank Brewing"]

    [brewery_1, brewery_2]
  end



end
