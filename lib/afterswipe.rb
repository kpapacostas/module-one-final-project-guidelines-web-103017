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
    # User.new(name: @name, date_name: @date_name)
  end

end
#
# as = AfterSwipe.new
# as.greeting
# as.get_date_name
# as.get_name
