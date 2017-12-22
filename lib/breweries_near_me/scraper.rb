class BreweriesNearMe::Scraper
  include Helpers

  def create_city_from_scrape(city_input)
    html = "https://www.beeradvocate.com/place/list/?&city=#{city_input}&brewery=Y&sort=name&sort=avgbeers"
    doc = Nokogiri::HTML(open(html))
    brewery_table_rows = doc.css('#ba-content table tr')

    breweries_that_have_ratings = brewery_table_rows[3..-1].collect do |row|
      #first 3 rows are garbage
      name_and_ratings = row.css('b').collect do |text|
        text.text
      end

      if name_and_ratings[3] != "-" && name_and_ratings[4].to_i > 10
        name_and_ratings
      end

    end

    top_ten_breweries = breweries_that_have_ratings.reject { |brewery| brewery.nil? || brewery.empty?}[0..9]
    binding.pry
  end
end
