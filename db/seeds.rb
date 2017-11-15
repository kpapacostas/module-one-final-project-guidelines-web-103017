require_relative '../app/models/recipes_adapter_class.rb'
require_relative '../config/environment.rb'
require_relative '../app/models/recipe.rb'
require_relative '../app/models/drink.rb'
require_relative '../app/models/drinks_adapter_class.rb'


mexican = RecipeAdapter.get_recipes_from_api("mexican")
mexican.each do |row|
  Recipe.create(title: row["title"], url: row["href"], ingredients: row["ingredients"], cuisine: "Mexican")
end

italian = RecipeAdapter.get_recipes_from_api("italian")
italian.each do |row|
  Recipe.create(title: row["title"], url: row["href"], ingredients: row["ingredients"], cuisine: "Italian")
end

american = RecipeAdapter.get_recipes_from_api("american")
american.each do |row|
  Recipe.create(title: row["title"], url: row["href"], ingredients: row["ingredients"], cuisine: "American")
end

thai = RecipeAdapter.get_recipes_from_api("thai")
thai.each do |row|
  Recipe.create(title: row["title"], url: row["href"], ingredients: row["ingredients"], cuisine: "Thai")
end

korean = RecipeAdapter.get_recipes_from_api("korean")
korean.each do |row|
  Recipe.create(title: row["title"], url: row["href"], ingredients: row["ingredients"], cuisine: "Korean")
end

vodka = DrinkAdapter.get_drinks_from_api("absolut-vodka")

vodka.each do |row|
  ingredients = row["ingredients"].map{|ing| ing["textPlain"]}
  Drink.create(name: row["name"], ingredients: ingredients.join(', '), instructions: row["descriptionPlain"], liquor: "Vodka" )
end

tequila = DrinkAdapter.get_drinks_from_api("tequila")

tequila.each do |row|
  ingredients = row["ingredients"].map{|ing| ing["textPlain"]}
  Drink.create(name: row["name"], ingredients: ingredients.join(', '), instructions: row["descriptionPlain"], liquor: "Tequila" )
end

gin = DrinkAdapter.get_drinks_from_api("gin")

gin.each do |row|
  ingredients = row["ingredients"].map{|ing| ing["textPlain"]}
  Drink.create(name: row["name"], ingredients: ingredients.join(', '), instructions: row["descriptionPlain"], liquor: "Gin" )
end

bourbon = DrinkAdapter.get_drinks_from_api("bourbon")

bourbon.each do |row|
  ingredients = row["ingredients"].map{|ing| ing["textPlain"]}
  Drink.create(name: row["name"], ingredients: ingredients.join(', '), instructions: row["descriptionPlain"], liquor: "Bourbon" )
end

beer = DrinkAdapter.get_drinks_from_api("beer")

beer.each do |row|
  ingredients = row["ingredients"].map{|ing| ing["textPlain"]}
  Drink.create(name: row["name"], ingredients: ingredients.join(', '), instructions: row["descriptionPlain"], liquor: "Beer" )
end


binding.pry
true
