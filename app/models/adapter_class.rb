require 'rest-client'
require 'json'
require 'pry'

def get_recipes_from_api(cuisine)
  recipes = RestClient.get('http://www.recipepuppy.com/api/?q="cuisine"')
  recipe_hash = JSON.parse(recipes)
end

get_recipes_from_api("Mexican")
