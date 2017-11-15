require 'rest-client'
require 'json'
require 'pry'

class DrinkAdapter
  def self.get_drinks_from_api(liquor)
    drinks = RestClient.get("http://addb.absolutdrinks.com/drinks/with/#{liquor}/?apiKey=212e54ee503645b1ae188869404d8e20")
    drinks_hash = JSON.parse(drinks)
    drinks_hash["result"]
  end
end


true
