require_relative '../config/environment.rb'
require_relative '../app/models/recipe.rb'
require_relative '../app/models/drink.rb'
require_relative '../app/models/playlist.rb'
require_relative '../app/models/date_card.rb'
require_relative '../app/models/user.rb'
#greeting
#users name
#date name
#what would like to add to your dc?
#recipe/drinks/playlist
#date_card presentation
class AfterSwipe

  attr_accessor :name, :date_name

  def greeting
    puts "Welcome Dater! We're glad you're taking charge of your dating experience! Follow prompts to add to your date card."
  end

  def get_name
    puts "What is your name?"
    @name = gets.chomp
    puts "Hi #{@name}!"
  end

  def get_date_name
    puts "What is your date's name?"
    @date_name = gets.chomp
    puts "Lucky #{@date_name}!"
  end

  def create_user
    new_user = User.create(name: @name, date_name: @date_name)
    new_user.save
  end

  def recipe_questions
    puts "What kind of cuisine would you like to cook for #{@date_name}?\n" "Choose from the options below.\n" "Mexican\n" "Italian \n" "American\n" "Korean\n" "Thai\n"
    @cuisine_type = gets.chomp.upcase
    recipes = Recipe.where(cuisine: "#{@cuisine_type}")
    recipes.sample
    #find cuisine type on database and save id to datecard table with the matching user id
  end

  def drinks_questions
    puts "What kind of cuisine would you like to cook for #{@date_name}?\n" "Choose from the options below.\n" "Vodka\n" "Tequila \n" "Bourbon\n" "Gin\n" "Beer\n"
    @liquor_type = gets.chomp.upcase
  end


end
#
# as = AfterSwipe.new
# as.get_date_name
# as.get_name
# as.create_user
