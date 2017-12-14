#refactor everything

class BreweriesNearMe::API

  def self.get_all_brewery_info(input)
    city_url = "https://api.brewerydb.com/v2/locations?locality=#{input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d&format=json"
    binding.pry
    brewery_list = RestClient.get(city_url)
    parsed_list = JSON.parse(brewery_list)
    brewery_array = parsed_list["data"]

    if brewery_array == nil
      BreweriesNearMe:CLI.new.call
    end
  end

end
