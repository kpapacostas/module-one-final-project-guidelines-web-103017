require_relative '../config/environment.rb'
require_relative '../app/models/recipe.rb'
require_relative '../app/models/drink.rb'
require_relative '../app/models/date_card.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/song.rb'
require_relative '../app/models/playlist_date_card.rb'
require_relative '../app/models/recipe_date_card.rb'
require_relative '../app/models/drink_date_card.rb'


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

    if !PlaylistDateCard.where(date_card_id: @date_card.id)
      self.playlist_options
    elsif @date_card.drink_id == nil
      self.drinks_questions
    elsif @date_card.recipe_id == nil
      self.recipe_questions
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

  def date_card_presentation
    puts "Congratulations, you've created the perfect date!\n" "Press enter to see your Date Card!\n"
    recipe = Recipe.where(id: @date_card.recipe_id)
    puts "You'll be making #{@date_name} #{recipe[0].title}!"
    puts "Here are the things you need to buy:\n" "#{recipe[0].ingredients}"
    puts "Here are your instructions:\n""#{recipe[0].url}"

    drink = Drink.where(id:@date_card.drink_id)
    puts "You two will be drinking #{drink[0].name}!"
    puts "Here's what you'll need:\n" "#{drink[0].ingredients}\n"
    puts "Here's how to make it:\n" "#{drink[0].instructions}"

    playlist = PlaylistDateCard.where(date_card_id: @date_card.id)
    playlist_songs = playlist.map do |song|
      Song.where(id: song.song_id)
    end
    songs_proper = playlist_songs.flatten
    puts "Here is everything you'll need to really set the mood!\n"
    puts "#{songs_proper[0].title} by #{songs_proper[0].artist}\n" "#{songs_proper[0].song_link}\n"
    puts "#{songs_proper[1].title} by #{songs_proper[1].artist}\n" "#{songs_proper[1].song_link}\n"
    puts "#{songs_proper[2].title} by #{songs_proper[2].artist}\n" "#{songs_proper[2].song_link}\n"
    puts "#{songs_proper[3].title} by #{songs_proper[3].artist}\n" "#{songs_proper[3].song_link}\n"
    puts "#{songs_proper[4].title} by #{songs_proper[4].artist}\n" "#{songs_proper[4].song_link}\n"
  end
binding.pry
end

# as = AfterSwipe.new
# as.get_name
# as.get_date_name
# as.create_user
# as.initial_prompt
