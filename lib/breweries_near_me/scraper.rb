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
    top_ten_breweries = breweries_that_have_ratings.reject { |brewery| brewery.nil? || brewery.empty?}[0..9]
    #top_ten_breweries now has two elements, name and avg beer rating. #put in specific brewery url/id to top_ten_breweries. Brewery at this point should have name, url/id, and rating.
    top_ten_breweries.collect { |brewery| brewery.slice!(1..2) }
    binding.pry
    top_ten_breweries.each do |brewery|
        new_brewery = BreweriesNearMe::Brewery.new(brewery[0], brewery["breweryId"], brewery[1] )#id won't work as is.

        get_beer_from_brewery_page(new_brewery.id)

        beers = BreweriesNearMe::Beer.all
        beers = beers.find_all { |beer| beer.brewery_id == new_brewery.id }

        new_brewery.add_beers(beers)
        new_brewery.save
      end
    end
  end

  def get_beer_from_api(the_brewery_id)
    beer_url = "https://api.brewerydb.com/v2/brewery/#{the_brewery_id}/beers?key=#{api_key}&format=json" #change url. everything below this is just copied from api class.

    beer_list = RestClient.get(beer_url)
    parsed_list = JSON.parse(beer_list)
    beer_array = parsed_list["data"]

    if beer_array

      first_three_beers = beer_array[0..2]
      first_three_beers.each do |beer|
        if beer["style"] != nil
          style_name = beer["style"]['shortName']
        end
        new_beer = BreweriesNearMe::Beer.new(beer["name"], the_brewery_id, beer["description"], beer["abv"],style_name)

        new_beer.save
      end
    end
  end

end
