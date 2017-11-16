require_relative '../config/environment.rb'
require_relative '../app/models/recipe.rb'
require_relative '../app/models/drink.rb'
require_relative '../app/models/date_card.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/song.rb'
require_relative '../app/models/playlist_date_card.rb'
require_relative '../app/models/recipe_date_card.rb'
require_relative '../app/models/drink_date_card.rb'


#greeting
#users name
#date name
#what would like to add to your dc?
#recipe/drinks/playlist
#date_card presentation
class AfterSwipe

  attr_accessor :name, :date_name, :new_user, :date_card

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
  end

  def init_dc
    new_card = DateCard.create
    new_card.user_id = @new_user.id
    new_card.save
    @date_card = new_card
  end

  def check_choices

    if @date_card.playlist_id == nil
      self.playlist_options
      # self.check_choices
    elsif @date_card.drink_id == nil
      self.drinks_questions
      # self.check_choices
    elsif @date_card.recipe_id == nil
      self.recipe_questions
      # self.check_choices
    else
      self.date_card_presentation
    end
  end

  def recipe_questions
    puts "What kind of cuisine would you like to cook for #{@date_name}?\n" "Choose from the options below:\n" "Mexican\n" "Italian \n" "American\n" "Korean\n" "Thai\n"
    @cuisine_type = gets.chomp.upcase
    recipes = Recipe.where(cuisine: "#{@cuisine_type}")
    recipe = recipes.sample
    recipe.date_cards << @date_card
    self.check_choices
  end

  def drinks_questions
    puts "What kind of drink would you like to whip up for #{@date_name}?\n" "Choose from the options below:\n" "Vodka\n" "Tequila \n" "Bourbon\n" "Gin\n" "Beer\n"
    @liquor_type = gets.chomp.upcase
    drinks = Drink.where(liquor: "#{@liquor_type}")
    drink = drinks.sample
    drink.date_cards << @date_card
    self.check_choices
  end

  def playlist_options
    puts "What kind of music would you like to set the mood for #{@date_name}?\n" "Choose from the following genres:\n" "R & B\n" "Top 40\n" "Country\n" "Jazz\n" "Rock 'n' Roll\n"
    @genre = gets.chomp.upcase
    playlist = Song.where(genre: "#{@genre}")

    playlist.each do |song|
      PlaylistDateCard.create(date_card_id: @date_card.id, song_id: song.id)
    end
    self.check_choices
  end

  def initial_prompt
    puts "What would you like to start with?\n" "Choose from the following options:\n" "Food\n" "Drinks\n" "Music\n"
    @first_choice = gets.chomp.upcase
    if @first_choice == "FOOD"
      self.recipe_questions
    elsif @first_choice == "DRINKS"
      self.drinks_questions
    elsif @first_choice == "MUSIC"
      self.playlist_options
    else
      puts "Please choose one."
      self.initial_prompt
    end
  end
  binding.pry
  def date_card_presentation
    puts "We made it!"
  end

end

# as = AfterSwipe.new
# as.get_name
# as.get_date_name
# as.create_user
# as.initial_prompt
