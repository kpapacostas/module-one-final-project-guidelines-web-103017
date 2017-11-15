require_relative '../app/models/recipes_adapter_class.rb'
require_relative '../config/environment.rb'
require_relative '../app/models/recipe.rb'

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


binding.pry

true 
