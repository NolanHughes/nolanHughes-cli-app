class BreweriesNearMe::Beer
  attr_accessor :name, :description, :style, :brewery_id, :abv

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name = nil, brewery_id = nil, description = "N/A", abv = nil, style = "N/A")
    @name = name
    @description = description
    @abv = abv
    @brewery_id = brewery_id
    @style = style
  end

end
