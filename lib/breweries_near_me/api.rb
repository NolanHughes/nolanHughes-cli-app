class BreweriesNearMe::API
  include Helpers
  # def self.get_all_brewery_info(input)
  #   city_url = "https://api.brewerydb.com/v2/locations?locality=#{input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d&format=json"
  #
  #   brewery_list = RestClient.get(city_url)
  #   parsed_list = JSON.parse(brewery_list)
  #   brewery_array = parsed_list["data"]
  #
  #   if brewery_array == nil
  #     puts "That doesn't appear to be a city in our database. Please try another city or check for misspellings."
  #     puts ""
  #     BreweriesNearMe::CLI.new.call
  #   else
  #     brewery_array
  #   end
  # end

  def create_city(input)
    city_name = capitalize(input)
    new_city = BreweriesNearMe::City.new(city_name)

    get_all_brewery_info(input)

    breweries = BreweriesNearMe::Breweries.all.uniq { |brewery| brewery.id }
    breweries = breweries.find_all { |brewery| brewery.location == new_city.name }

    new_city.breweries = breweries
    new_city.save
    new_city
  end

  def get_all_brewery_info(input)
    #Should I hide my api key somehow?
    all_breweries_url = "https://api.brewerydb.com/v2/locations?locality=#{input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d&format=json"

    brewery_list = RestClient.get(all_breweries_url)
    parsed_list = JSON.parse(brewery_list)
    brewery_array = parsed_list["data"]

    if brewery_array == nil
      puts "That doesn't appear to be a city in our database. Please try another city or check for misspellings."
      puts ""
      BreweriesNearMe::CLI.new.call
    else
      brewery_array.each do |brewery|
        new_brewery = BreweriesNearMe::Breweries.new(brewery["brewery"]["name"], brewery["brewery"]["description"], brewery["brewery"]["established"], brewery["breweryId"], brewery["locality"])
        # Why can't I do this?
        # new_brewery.name = brewery["brewery"]["name"],
        # new_brewery.description = brewery["brewery"]["description"],
        # new_brewery.year_established = brewery["brewery"]["established"],
        # new_brewery.id = brewery["breweryId"]
        get_beer_from_api(new_brewery.id)

        beers = BreweriesNearMe::Beer.all
        beers = beers.find_all { |beer| beer.brewery_id == new_brewery.id }

        new_brewery.beer = beers
        new_brewery.save
      end
    end
  end

  def get_beer_from_api(the_brewery_id)
    beer_url = "https://api.brewerydb.com/v2/brewery/#{the_brewery_id}/beers?key=0cd9727ca8da27a76b3e6f7876fc6e6d&format=json"

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
        new_beer = BreweriesNearMe::Beer.new

        new_beer.name = beer["name"]
        new_beer.brewery_id = the_brewery_id
        new_beer.description = beer["description"]
        new_beer.abv = beer["abv"]
        new_beer.style = style_name

        new_beer.save
      end
    end
  end

  # def self.get_year_round_beer(id)
  #   beer_url = "https://api.brewerydb.com/v2/brewery/#{id}/beers?key=0cd9727ca8da27a76b3e6f7876fc6e6d&format=json"
  #
  #   beer_list = RestClient.get(beer_url)
  #   parsed_list = JSON.parse(beer_list)
  #   beer_array = parsed_list["data"]
  #
  #   if beer_array == nil
  #     nil
  #   else
  #     beer_array
  #   end
  # end

end
