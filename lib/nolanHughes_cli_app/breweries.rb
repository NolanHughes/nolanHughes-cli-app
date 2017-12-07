class NolanHughesCliApp::Breweries

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
      1. Begyle Brewery
      2. Half Acre Brewing Company
      3. Pipeworks Brewing Company
    DOC
  end

end
