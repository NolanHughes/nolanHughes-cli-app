How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

-A CLI for top or all breweries in a city/near you(zip code, 25 miles around)/whatever BreweryDB API will allow. Include description of brewery, location, year established, link to website(if I can figure that out), hours(if they have them), and hopefully top-rated beers(possible just year round). Have additional prompt to see all beers once you are in the specific brewery object.

user types top-breweries-near-me user types zip code

Shows a list of breweries in a 25 miles radius of zip code(input) Which brewery would you like more info about? Type a number or the full name

1. Begyle Brewery
2. Half Acre Brewing Company
3. Pipeworks Brewing Company

What is a brewery?
Has a name
Has a location
    Has link to google maps #optional
Has a description
Has a year established
Has a website link
    Has an actual link to website #optional
Has operating hours
Has beers
    Has a name
    Has availability (year round, seasonal, or limited)
    Has a rating #optional(ability to just see top-rated beers - will need to be an option )


Order should be:
1. create cities with name and breweries(has attributes) #move scrape to own class
      Top 10 cites #below
      Top 5 breweries #based on beer average, must have a number
2. print cities
3. print breweries in that city
4. print description of brewery

Cities
1. Portland
2. San Diego
3. Denver
4. Seattle
5. Chicago
6. San Francisco
7. NYC
8. Grand Rapids
9. Milwaukee
10. Minneapolis

Additions
1. Add number of beers?
