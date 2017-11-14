require 'rest-client'
require 'json'
require 'pry'

def get_recipes_from_api
  recipes = RestClient.get('http://www.recipepuppy.com/api/?q=pasta&p=3')
  recipe_hash = JSON.parse(recipes)
  recipe_hash
end
binding.pry
get_recipes_from_api
