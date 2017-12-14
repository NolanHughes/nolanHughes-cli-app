#remove duplicate breweries
class BreweriesNearMe::Breweries
  attr_accessor :name, :description, :year_established, :id, :year_round_beer#, :type :location, :has_taproom

  @@all_breweries_in_city = []

  def initialize(name = nil, description = nil, year_established = nil, id = nil, year_round_beer = nil)
    @name = name
    @description = description
    @year_established = year_established
    @id = id
    @year_round_beer = year_round_beer
  end

  def self.all
    @@all_breweries_in_city
  end

  def self.new_breweries_from_api(all_breweries_in_city)
    all_breweries_array = []

    all_breweries_in_city.each do |brewery|

      BreweriesNearMe::Beer.year_round_beer(brewery["breweryId"])
      beer_array = BreweriesNearMe::Beer.all

      brewery_1 = self.new(
        brewery["brewery"]["name"],
        brewery["brewery"]["description"],
        brewery["brewery"]["established"],
        brewery["breweryId"],
        beer_array
      )
      all_breweries_array << brewery_1
    end
    all_breweries_array
    binding.pry
  end

  def self.add_breweries_to_city(breweries)
    city = BreweriesNearMe::City.city_instance
    city.each { |city| city.breweries = breweries }
  end

  def self.print_brewery_details(input, breweries)
    brewery = breweries[input.to_i - 1]
    puts ""
    puts "#{brewery.name}"
    puts "Description: #{brewery.description}"
    puts "Year Established: #{brewery.year_established}"
    puts "Year Round Beer: #{brewery.year_round_beer.join(", ")}"
  end

end
