class BreweriesNearMe::Beer
  attr_accessor :name, :description, :style, :brewery_id, :abv

  @@all_beers_in_brewery = []

  def self.all
    @@all_beers_in_brewery
  end

  def initialize(name = nil, brewery_id = nil, description = "N/A", abv = nil, style = "N/A")
    @name = name
    @description = description
    @abv = abv
    @brewery_id = brewery_id
    @style = style
  end

  def self.new_beers_from_api(breweries)

    breweries.each do |brewery|
      beers_in_brewery = []

      beer_array = BreweriesNearMe::API.get_year_round_beer(brewery.id)

      if beer_array != nil
        first_three_beers = beer_array[0..2]
        first_three_beers.each do |beer|
          if beer["style"] != nil
            style = beer["style"]['name']
          end
          
          style_name = []
          a_beer = self.new(beer["name"], brewery.id, beer["description"], beer["abv"], style)
          beers_in_brewery << a_beer
        end
      else
        beers_in_brewery << a_beer = self.new("N/A", brewery.id)
      end
      BreweriesNearMe::Breweries.add_beers_to_brewery(beers_in_brewery)
    end
  end

end
