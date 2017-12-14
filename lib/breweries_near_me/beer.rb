class BreweriesNearMe::Beer
  attr_accessor :name, :description, :style

  @@all_beers_in_city = []

  def self.all
    @@all_beers_in_city
  end

  def initialize(name = nil, description = nil, style = nil)
    @name = name
    @description = description
    @style = style
  end

  def self.year_round_beer(id)
    all_beer_array = []

    beer_array = BreweriesNearMe::API.get_year_round_beer(id)

    beer_array.each do |beer|
      if beer["available"] == nil
        nil
      elsif beer["available"]["name"].downcase == "year round"
        beer_1 = self.new(
          beer["name"],
          beer["description"],
          beer["style"]["shortName"]
        )
        all_beer_array << beer_1
      end
    end

    all.shift
    all << all_beer_array
  end

end
