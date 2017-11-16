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

  attr_accessor :name, :date_name, :new_user, :date_card, :header


  def greeting
    puts "\n\n"
    puts "                              AFTERSWIPE\n".cyan.bold
    puts "|===============================================================================|"
    puts "\n"
    puts "                             Welcome Dater!".cyan.bold
    puts "      We're glad you're taking charge of your dating experience!".cyan.bold
    puts "  Follow prompts to add to your date card, and plan the perfect night.\n".cyan.bold
    puts "|===============================================================================|"
    puts "\n"
  end

  def get_name
    puts "  What is your name?".blue.bold
    @name = gets.chomp
    puts "  Hi #{@name}!\n".blue.bold
    puts "|===============================================================================|"
    puts "\n"
  end

  def get_date_name
    puts "  What is your date's name?".blue.bold
    @date_name = gets.chomp
    puts "  Lucky #{@date_name}!\n".blue.bold
    puts "|===============================================================================|"
    puts "\n"
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

    if PlaylistDateCard.where(date_card_id: @date_card.id) == []
      puts "  Let's keep planning your date!\n".blue.bold
      self.playlist_options
    elsif @date_card.drink_id == nil
      puts "  Let's keep planning your date!\n".blue.bold
      self.drinks_questions
    elsif @date_card.recipe_id == nil
      puts "  Let's keep planning your date!\n".blue.bold
      self.recipe_questions
    else
      self.date_card_presentation
    end
  end

  def recipe_questions
    puts "  What kind of cuisine would you like to cook for #{@date_name}?\n".blue.bold
    puts "  Choose from the options below:\n".blue.bold
    puts "  Mexican".green.bold
    puts "  Italian".green.bold
    puts "  American".green.bold
    puts "  Korean".green.bold
    puts "  Thai".green.bold
    @cuisine_type = gets.chomp.upcase
    recipes = Recipe.where(cuisine: "#{@cuisine_type}")
    recipe = recipes.sample
    recipe.date_cards << @date_card
    puts "|===============================================================================|"
    puts "\n"
    self.check_choices
  end

  def drinks_questions
    puts "  What kind of drink would you like to whip up for #{@date_name}?\n".blue.bold
    puts "  Choose from the options below:\n".blue.bold
    puts "  Vodka".green.bold
    puts "  Tequila".green.bold
    puts "  Bourbon".green.bold
    puts "  Gin".green.bold
    puts "  Beer".green.bold
    @liquor_type = gets.chomp.upcase
    drinks = Drink.where(liquor: "#{@liquor_type}")
    drink = drinks.sample
    drink.date_cards << @date_card
    puts "|===============================================================================|"
    puts "\n"
    self.check_choices
  end

  def playlist_options
    puts "  What kind of music would you like to set the mood for #{@date_name}?\n".blue.bold
    puts "  Choose from the following genres:\n".blue.bold
    puts "  R & B".green.bold
    puts "  Top 40".green.bold
    puts "  Country".green.bold
    puts "  Jazz".green.bold
    puts "  Rock 'n' Roll".green.bold
    @genre = gets.chomp.upcase
    playlist = Song.where(genre: "#{@genre}")

    playlist.each do |song|
      PlaylistDateCard.create(date_card_id: @date_card.id, song_id: song.id)
    end

    playlist = PlaylistDateCard.where(date_card_id: @date_card.id)
    playlist_songs = playlist.map do |song|
            Song.where(id: song.song_id)
        end
    @songs_proper = playlist_songs.flatten
    puts "|===============================================================================|"
    puts "\n"
    self.check_choices
  end

  def initial_prompt
    puts "  What would you like to start with?\n".blue.bold
    puts "  Choose from the following options:\n".blue.bold
    puts "  Food".green.bold
    puts "  Drinks".green.bold
    puts "  Music".green.bold
    @first_choice = gets.chomp.upcase
    puts "|===============================================================================|"
    puts "\n"
    if @first_choice == "FOOD"
      self.recipe_questions
    elsif @first_choice == "DRINKS"
      self.drinks_questions
    elsif @first_choice == "MUSIC"
      self.playlist_options
    else
      puts "  Please choose one."
      self.initial_prompt
    end
  end


  def date_card_presentation
    puts "\n\n"
    puts "Congratulations, you've created the perfect date!\n".blue.bold
    puts "\n Press 'enter' to see your date night details\n"
    gets.chomp
    recipe = Recipe.where(id: @date_card.recipe_id)
    puts "You'll be making #{@date_name} #{recipe[0].title}!\n".blue.bold
    puts "Here are the things you need to buy:\n".blue.bold
    puts "#{recipe[0].ingredients}\n".green
    puts "Here are your instructions:\n".blue.bold
    puts "#{recipe[0].url}\n".green
    puts "|===============================================================================|"
    puts "\n"
    puts "Press 'enter' to see what you'll be drinking."
    gets.chomp
    drink = Drink.where(id:@date_card.drink_id)
    puts "You two will be drinking #{drink[0].name}s!\n".blue.bold
    puts "Here's what you'll need:\n".blue.bold
    puts "#{drink[0].ingredients}\n".green
    puts "Here's how to make it:\n".blue.bold
    puts "#{drink[0].instructions}\n".green
    puts "|===============================================================================|"
    puts "\n"
    puts "Press 'enter' to see what you'll be listening to."
    gets.chomp
    puts "Here is everything you'll need to really set the mood!\n".blue.bold
    puts "#{@songs_proper[0].title} by #{@songs_proper[0].artist}\n".green.bold
    puts "#{@songs_proper[0].song_link}\n".green
    puts "#{@songs_proper[1].title} by #{@songs_proper[1].artist}\n".green.bold
    puts "#{@songs_proper[1].song_link}\n".green
    puts "#{@songs_proper[2].title} by #{@songs_proper[2].artist}\n".green.bold
    puts "#{@songs_proper[2].song_link}\n".green
    puts "#{@songs_proper[3].title} by #{@songs_proper[3].artist}\n".green.bold
    puts "#{@songs_proper[3].song_link}\n".green
    puts "#{@songs_proper[4].title} by #{@songs_proper[4].artist}\n".green.bold
    puts "#{@songs_proper[4].song_link}\n".green
    puts "|===============================================================================|"
    puts "\n"
    puts "Happy dating #{@name}! Hope it goes well with #{@date_name} ;)\n\n".cyan.bold
  end

  def self.runner
    newb = AfterSwipe.new
    newb.greeting
    newb.get_name
    newb.get_date_name
    newb.create_user
    newb.init_dc
    newb.initial_prompt
  end
end
