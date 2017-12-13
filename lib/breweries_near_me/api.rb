#refactor everything

class BreweriesNearMe::API

  def self.get_brewery_list(input)
    breweries = []

    if input.to_i > 0
      input.to_i
      city_url = "http://api.brewerydb.com/v2/locations?postalCode=#{input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d/"
    else
      city_url = "http://api.brewerydb.com/v2/locations?locality=#{input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d/"
    end
    brewery_list = RestClient.get(city_url)
    @brewery_list = JSON.parse(brewery_list)
    @brewery_array = @brewery_list["data"]
    puts "Here is the list of breweries from #{input.to_s.split(" ").collect { |e| e.capitalize }.join(" ")}"
    @brewery_array.each.with_index(1) do |brewery, i|
      
      puts "#{i}. #{brewery["brewery"]["name"]}"
    end
  end

end
