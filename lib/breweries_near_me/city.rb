class BreweriesNearMe::City
  attr_accessor :name, :breweries

  @@all_cities = []

  def self.create_cities

    @city_1 = self.new
    @city_1.name =  "Chicago"
    @@all_cities << @city_1

    @city_2 = self.new
    @city_2.name =  "Fort Collins"
    @@all_cities << @city_2

  end

  def self.all
    @@all_cities
  end

  def self.add_brewery
    @city_1.breweries = BreweriesNearMe::Brewery.create_breweries(@city_1.name)
    @city_2.breweries = BreweriesNearMe::Brewery.create_breweries(@city_2.name)
    [@city_1, @city_2]
  end

  def self.print_brewery_names
    all.each do |city|
      city.breweries.each.with_index(1) do |brewery, i|
        puts "#{i}. #{brewery.name}"
      end
    end
  end



end
