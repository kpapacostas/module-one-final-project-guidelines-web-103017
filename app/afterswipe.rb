require_relative '../config/environment.rb'
require_relative '../app/models/recipe.rb'
require_relative '../app/models/drink.rb'
require_relative '../app/models/date_card.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/song.rb'
require_relative '../app/models/playlist_date_card.rb'

#greeting
#users name
#date name
#what would like to add to your dc?
#recipe/drinks/playlist
#date_card presentation
class AfterSwipe

  attr_accessor :name, :date_name, :new_user

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
    @new_user = User.create(name: @name, date_name: @date_name)
    @new_user.save
    @new_user.init_dc
  end

  def recipe_questions
    puts "What kind of cuisine would you like to cook for #{@date_name}?\n" "Choose from the options below:\n" "Mexican\n" "Italian \n" "American\n" "Korean\n" "Thai\n"
    @cuisine_type = gets.chomp.upcase
    recipes = Recipe.where(cuisine: "#{@cuisine_type}")
    q = recipes.sample
    v = RecipeDateCard.create(recipe_id: q.id, date_card_id: @new_user.date_card.id)
    #find cuisine type on database and save id to datecard table with the matching user id
  end

  def drinks_questions
    puts "What kind of drink would you like to whip up for #{@date_name}?\n" "Choose from the options below:\n" "Vodka\n" "Tequila \n" "Bourbon\n" "Gin\n" "Beer\n"
    @liquor_type = gets.chomp.upcase
    drinks = Drink.where(liquor: "#{@liquor_type}")
    drinks.sample
  end

  def playlist_options
    puts "What kind of music would you like to set the mood for #{@date_name}?\n" "Choose from the following genres:\n" "R & B\n" "Top 40\n" "Country\n" "Jazz\n" "Rock 'n' Roll\n"
    @genre = gets.chomp.upcase
    playlist = Song.where(genre: "#{@genre}")
    binding.pry

    v = PlaylistDateCard.create(song: q.id, date_card_id: @new_user.date_card.id)
  end
  binding.pry

end
#
# as = AfterSwipe.new
# as.get_date_name
# as.get_name
# as.create_user
