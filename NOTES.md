How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

-A CLI for top or all breweries in a city. Include description of brewery, location, year established, link to website(if I can figure that out), hours(if they have them), and hopefully top-rated beers(possible just year round). Have additional prompt to see all beers once you are in the specific brewery object.

user types breweries-near-me user types city name

Shows a list of breweries from that city Which brewery would you like more info about? Type a number

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

Additions
1. Add number of beers?

1. Get input(city)
2. create city
3. get all of the breweries to a brewery array
2. create breweries
3. add breweries to city
4. list breweries from city
