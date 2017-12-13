class BreweriesNearMe::City
  attr_accessor :name, :breweries

  #maybe scrape data to make this list?
  @@top_beer_cities= {
    "OR" => "Portland",
    "CA" => "San Diego",
    "CO" => "Denver",
    "WA" => "Seattle",
    "IL" => "Chicago",
    "NY" => "NYC",
    "MI" => "Grand Rapids",
    "WI" => "Milwaukee",
    "MN" => "Minneapolis",
    "NC" => "Asheville"
}

  @@all_cities = []

  def self.all
    @@all_cities
  end

  def self.create_cities
    self.scrape_cities
    add_breweries
    all
        # @city_1 = self.new
        # @city_1.name =  "Chicago"
        # @@all_cities << @city_1
        #
        # @city_2 = self.new
        # @city_2.name =  "Fort Collins"
        # @@all_cities << @city_2
  end

  def self.scrape_cities
    #go to beeradvocate, find the name of the city
    #instantiate a city
    #push city to @@all_cities
    @@top_beer_cities.each do |state, city|
      doc = Nokogiri::HTML(open("https://www.beeradvocate.com/place/list/?&c_id=US&s_id=#{state}&city=#{city}&sort=name&sort=avgbeers"))
      binding.pry
      city =
      @@all_cities << city
    end

  end

  def self.add_breweries
    all.each do |city|
      city.breweries = BreweriesNearMe::Brewery.create_breweries(city.name)
    end
  end

end

#doc.css("#ba-content td.hr_bottom_dark").last.text.split[3]
