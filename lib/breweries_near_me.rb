require 'pry'
require 'rest-client'
require 'json'
#Should I change the order of these?
require_relative './breweries_near_me/helpers'
require_relative './breweries_near_me/api'
require_relative './breweries_near_me/beer'
require_relative './breweries_near_me/brewery'
require_relative './breweries_near_me/city'
require_relative './breweries_near_me/cli'
require_relative "./breweries_near_me/version"

#Make your api key the value of the below key/value pair in the hash
# KEY = {:api_key => ""}
