class NolanHughesCliApp::Brewery

  def self.all
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
