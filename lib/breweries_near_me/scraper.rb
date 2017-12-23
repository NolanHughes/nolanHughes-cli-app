class BreweriesNearMe::Scraper
  include Helpers

  def create_city(city_input)
    city_name = capitalize(city_input)
    new_city = BreweriesNearMe::City.new(city_name)

    brewery_array = create_brewery_from_scrape(city_input)

    if brewery_array == nil
      nil
    else
      breweries = BreweriesNearMe::Brewery.all.uniq { |brewery| brewery.id }
      breweries = breweries.find_all { |brewery| brewery.location == new_city.name }

      new_city.add_breweries(breweries)
      new_city.save
      new_city
    end
  end

  def create_brewery_from_scrape(city_input)
    html = "https://www.beeradvocate.com/place/list/?&city=#{city_input}&brewery=Y&sort=name&sort=avgbeers"
    doc = Nokogiri::HTML(open(html))
    brewery_table_rows = doc.css('#ba-content table tr')

    breweries_that_have_ratings = brewery_table_rows[3..-1].collect do |row|
      name_and_ratings = row.css('b').collect do |text|
        text.text
      end

      if name_and_ratings[3] != "-" && name_and_ratings[4].to_i > 10
        name_and_ratings
      end
    end
    #Add specific brewery url/id to top_ten_breweries. Brewery at this point should have name, url/id, and rating.
    top_ten_breweries_with_unnecessary_elements = breweries_that_have_ratings.reject { |brewery| brewery.nil? || brewery.empty?}[0..9]
    #top_ten_breweries now has two elements, name and avg beer rating
    top_ten_breweries = top_ten_breweries_with_unnecessary_elements.collect { |brewery| brewery.slice!(1..2) }
  end
end
