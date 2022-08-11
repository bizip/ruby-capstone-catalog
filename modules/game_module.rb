require_relative '../game'
require_relative '../author'

module CreateGames
  def add_game # rubocop:todo Metrics/MethodLength
    puts 'Name of Game:'
    name_of_game = gets.chomp.to_s
    puts 'Is it multiplayer [y] or [n]: '
    multiplayer = gets.chomp.to_s
    puts 'How many years last time played:'
    last_played_at = gets.chomp.to_s
    puts 'Firstname of author:'
    first_name = gets.chomp.to_s
    puts 'Lastname of author:'
    last_name = gets.chomp.to_s
    case multiplayer
    when 'y'
      multiplayer = 'Yes'
      game = Game.new(name_of_game, multiplayer, last_played_at, first_name, last_name)
      author = Author.new(first_name, last_name)
      @games.push(game)
      @authors.push(author)
      puts 'Game created successfully'
    when 'n'
      multiplayer = 'No'
      game = Game.new(name_of_game, multiplayer, last_played_at, first_name, last_name)
      author = Author.new(first_name, last_name)
      @games.push(game)
      @authors.push(author)
      puts 'Game created successfully'
    else
      puts 'Please enter corresponding value for multiplayer'
    end
  end

  def list_all_games
    if @games.empty?
      puts 'The list is empty'
    else
      @games.each do |game|
        # rubocop:todo Layout/LineLength
        puts "'#{game.name_of_game}' by #{game.first_name} #{game.last_name}, Multiplayer: #{game.multiplayer}, Last time played: #{game.last_played_at}"
        # rubocop:enable Layout/LineLength
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'The list is empty'
    else
      @authors.each do |author|
        puts "Author name: #{author.first_name} #{author.last_name}"
      end
    end
  end
end
