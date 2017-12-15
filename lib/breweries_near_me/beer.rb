class BreweriesNearMe::Beer
  attr_accessor :name, :description, :style

  @@all_beers_in_city = []

  def self.all
    @@all_beers_in_city
  end

  def initialize(name = nil)#, description = nil, style = nil)
    @name = name
    @description = description
    @style = style
  end

  def self.year_round_beer(id)
    all_beer_array = []

    beer_array = BreweriesNearMe::API.get_year_round_beer(id)
    binding.pry
    beer_array.each do |beer|
      binding.pry
      beer_1 = self.new(beer["name"])
      # # binding.pry
      # if beer["available"] == nil
      #   nil
      # elsif beer["available"]["name"].downcase == "year round"
      #   beer_1 = self.new(
      #     beer["name"]
      #     # beer["description"],
      #     # beer["style"]["shortName"]
      #   )
        all_beer_array << beer_1
      # end
    end
    #clear method maybe?
    #why is the third brewery in fargo coming up with nil for beer_array?
    all.shift
    all << all_beer_array
  end

end
