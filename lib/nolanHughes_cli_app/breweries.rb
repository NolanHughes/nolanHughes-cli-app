class NolanHughesCliApp::Breweries

  def self.all(city)
    puts <<-DOC.gsub /^\s*/, ''
      1. Begyle Brewery
      2. Half Acre Brewing Company
      3. Pipeworks Brewing Company
    DOC
    #
    # brewery_1 = Brewery.new
    # brewery_1
  end

end
