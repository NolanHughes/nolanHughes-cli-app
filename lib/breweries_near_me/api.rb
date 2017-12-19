class BreweriesNearMe::API

  def self.get_all_brewery_info(input)
    city_url = "https://api.brewerydb.com/v2/locations?locality=#{input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d&format=json"

    brewery_list = RestClient.get(city_url)
    parsed_list = JSON.parse(brewery_list)
    brewery_array = parsed_list["data"]

    if brewery_array == nil
      puts "That doesn't appear to be a city in our database. Please try another city or check for misspellings."
      puts ""
      BreweriesNearMe::CLI.new.call
    else
      brewery_array
    end
  end

  def self.get_year_round_beer(id)
    beer_url = "https://api.brewerydb.com/v2/brewery/#{id}/beers?key=0cd9727ca8da27a76b3e6f7876fc6e6d&format=json"

    beer_list = RestClient.get(beer_url)
    parsed_list = JSON.parse(beer_list)
    beer_array = parsed_list["data"]

    if beer_array == nil
      nil
    else
      beer_array
    end
  end

end
