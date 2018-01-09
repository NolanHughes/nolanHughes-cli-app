#filter out breweries with no info
class BreweriesNearMe::API
  include Helpers

  def create_city(input)
    city_name = capitalize(input)
    new_city = BreweriesNearMe::City.new(city_name)

    brewery_array = get_all_brewery_info(input)

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

  def get_all_brewery_info(input)
    api_key = KEY[:api_key]
    binding.pry
    #Should I hide my api key somehow? ***FIGURE THIS OUT***
    all_breweries_url = "https://api.brewerydb.com/v2/locations?locality=#{input}&key=#{api_key}&format=json"

    brewery_list = RestClient.get(all_breweries_url)
    parsed_list = JSON.parse(brewery_list)
    brewery_array = parsed_list["data"]

    if brewery_array == nil
      nil
    else
      brewery_array.each do |brewery|
        brewery_description = brewery["brewery"]["description"]
        isClosed = brewery["isClosed"]

        if brewery_description != nil && isClosed != "Y"
          new_brewery = BreweriesNearMe::Brewery.new(brewery["brewery"]["name"], brewery_description, brewery["brewery"]["established"], brewery["breweryId"], brewery["locality"], isClosed)

          get_beer_from_api(new_brewery.id)

          beers = BreweriesNearMe::Beer.all
          beers = beers.find_all { |beer| beer.brewery_id == new_brewery.id }

          new_brewery.add_beers(beers)
          new_brewery.save
        end
      end
    end
  end

  def get_beer_from_api(the_brewery_id)
    api_key = KEY[:api_key]
    beer_url = "https://api.brewerydb.com/v2/brewery/#{the_brewery_id}/beers?key=#{api_key}&format=json"

    beer_list = RestClient.get(beer_url)
    parsed_list = JSON.parse(beer_list)
    beer_array = parsed_list["data"]

    if beer_array
      #only using three beers because some breweries have way too many. I want to print top 10 rated beers based on BeerAdvocate ratings at some point.
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
