require 'rest-client'
require 'json'
require 'pry'

class RecipeAdapter
  def self.get_recipes_from_api(cuisine)
    recipes = RestClient.get("http://www.recipepuppy.com/api/?q=#{cuisine}")
    recipe_hash = JSON.parse(recipes)
    recipe_hash["results"]
  end
end




RecipeAdapter.get_recipes_from_api("mexican")
