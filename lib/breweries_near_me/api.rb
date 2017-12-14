#refactor everything

class BreweriesNearMe::API

  def self.get_breweries(input)
    @input = input

    if @input.to_i > 0
      @input.to_i
      city_url = "http://api.brewerydb.com/v2/locations?postalCode=#{@input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d/"
    else
      city_url = "http://api.brewerydb.com/v2/locations?locality=#{@input}&key=0cd9727ca8da27a76b3e6f7876fc6e6d/"
    end
    brewery_list = RestClient.get(city_url)
    parsed_list = JSON.parse(brewery_list)
    @brewery_array = parsed_list["data"]
    
    BreweriesNearMe::City.create_city(city_input)

    BreweriesNearMe::Brewery.all << @brewery_array
  end

  def self.list_breweries
    puts "Here is the list of breweries from #{@input.to_s.split(" ").collect { |e| e.capitalize }.join(" ")}"
    @brewery_array.each.with_index(1) do |brewery, i|
      puts "#{i}. #{brewery["brewery"]["name"]}"
    end
  end

end
