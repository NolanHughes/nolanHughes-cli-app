class BreweriesNearMe::Beer
  attr_accessor :name, :description, :style, :brewery_id

  @@all_beers_in_brewery = []

  def self.all
    @@all_beers_in_brewery
  end

  def initialize(name = nil, brewery_id)#, description = nil, style = nil)
    @name = name
    @description = description
    @style = style
    @brewery_id = brewery_id
  end

  def self.new_beers_from_api(breweries)

    breweries.each do |brewery|
      binding.pry
      beers_in_brewery = []
      
      beer_array = BreweriesNearMe::API.get_year_round_beer(brewery.id) 
      
      if beer_array != nil
        first_three_beers = beer_array[0..2]
        
        first_three_beers.each do |beer|
          a_beer = self.new(beer["name"], brewery.id)#, beer["description"], beer["style"]["shortName"])
          beers_in_brewery << a_beer
        end
      else
        beers_in_brewery << a_beer = self.new("N/A", brewery.id)
      end
      # binding.pry
      BreweriesNearMe::Breweries.add_beers_to_brewery(beers_in_brewery)
      # binding.pry
    end 
  end

  # def first_three_beers(beer_array)
  #   # all.clear
  #   binding.pry
  #   if beer_array != nil
  #     first_three_beers = beer_array[0..2]
  #     first_three_beers.each do |beer|
  #       a_beer = self.new(beer["name"])#, beer["description"], beer["style"]["shortName"])
  #       all << a_beer
  #     end
  #   else
  #     all << "No beers"
  #   end
  # end

end
