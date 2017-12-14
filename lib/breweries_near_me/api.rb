#refactor everything

class BreweriesNearMe::API

  def self.get_all_brewery_info(input)
    city_url = "http://api.brewerydb.com/v2/locations?locality=#{input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d/"

    brewery_list = RestClient.get(city_url)
    parsed_list = JSON.parse(brewery_list)
    brewery_array = parsed_list["data"]
  end

  # def self.list_breweries(input)
  #   puts "Here is the list of breweries from #{input.to_s.split(" ").collect { |e| e.capitalize }.join(" ")}"
  #   brewery_array.each.with_index(1) do |brewery, i|
  #     puts "#{i}. #{brewery["brewery"]["name"]}"
  #   end
  # end

end
