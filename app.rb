require './modules/book_module'
require './modules/game_module'
require './modules/music_album_module'

require_relative './book'
require_relative './label'
require_relative './game'
require_relative './author'
require_relative './music_album'
require 'json'

class App # rubocop:todo Metrics/ClassLength
  include CreateGames
  include HandleBooks
  include CreateMusicAlbum

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @music_albums = []
    @genres = []
    load_data
  end

  # rubocop:todo Metrics/PerceivedComplexity
  # rubocop:todo Metrics/MethodLength
  # rubocop:todo Metrics/AbcSize
  def load_data # rubocop:todo Metrics/CyclomaticComplexity, Metrics/AbcSize
    if File.empty?('books.json')
      puts 'List is empty'
    else
      books = JSON.parse(File.read('books.json'))
      books.each do |book|
        @books.push(Book.new(book['publisher'], book['cover_state'], book['title'], book['author']))
      end
    end
    if File.empty?('labels.json')
      puts 'List is empty'
    else
      labels = JSON.parse(File.read('labels.json'))
      labels.each do |label|
        @labels.push(Label.new(label['title'], label['color']))
      end
    end
    if File.empty?('add_music_album.json')
      puts 'List is empty'
    else
      music_albums = JSON.parse(File.read('add_music_album.json'))
      music_albums.each do |album|
        @music_albums.push(MusicAlbum.new(album['name'], album['on_spotify']))
      end
    end
    if File.empty?('add_genre.json')
      puts 'List is empty'
    else
      genres = JSON.parse(File.read('add_genre.json'))
      genres.each do |genre|
        @genres.push(Genre.new(genre['gnr']))
      end
    end
    if File.empty?('games.json')
      puts 'List is empty'
    else
      games = JSON.parse(File.read('games.json'))
      games.each do |game|
        @games.push(Game.new(game['name_of_game'], game['multiplayer'], game['last_played_at'], game['first_name'],
                             game['last_name']))
      end
    end
    if File.empty?('authors.json')
      puts 'List is empty'
    else
      authors = JSON.parse(File.read('authors.json'))
      authors.each do |author|
        @authors.push(Author.new(author['first_name'], author['last_name']))
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  def run
    puts 'Welcome to catalog app'
    menu
  end

  def menu
    puts
    puts 'Please select an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
    user_input
  end

  # rubocop:todo Metrics/MethodLength
  def selected_option(input) # rubocop:todo Metrics/CyclomaticComplexity, Metrics/MethodLength
    case input
    when '1'
      list_all_books
      menu
    when '2'
      list_all_music_albums
      menu
    when '3'
      list_all_games
      menu
    when '4'
      list_all_genres
      menu
    when '5'
      list_all_labels
      menu
    when '6'
      list_all_authors
      menu
    when '7'
      add_book
      menu
    when '8'
      add_music_album
      menu
    when '9'
      add_game
      menu
    when '10'
      save_data
      puts 'Thank you for using this app!'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength

  def user_input
    input = gets.chomp
    input_is_valid?(input)
  end

  def input_is_valid?(input)
    if %w[1 2 3 4 5 6 7 8 9 10].include?(input)
      selected_option input
    else
      puts "#{input} isn't in the list! Try again"
      menu
    end
  end

  def save_data # rubocop:todo Metrics/MethodLength
    books = []
    labels = []
    games = []
    authors = []
    music_albums = []
    genres = []

    @books.each do |book|
      books.push({ title: book.title, author: book.author, cover_state: book.cover_state, publisher: book.publisher })
    end
    @labels.each do |label|
      labels.push({ title: label.title, color: label.color })
    end
    @games.each do |game|
      games.push({ name_of_game: game.name_of_game, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                   first_name: game.first_name, last_name: game.last_name })
    end
    @authors.each do |author|
      authors.push({ first_name: author.first_name, last_name: author.last_name })
    end

    @music_albums.each do |album|
      music_albums.push({ name: album.name, on_spotify: album.on_spotify })
    end
    @genres.each do |gnr1|
      genres.push({ gnr: gnr1.name })
    end

    File.write('add_music_album.json', JSON.generate(music_albums))
    File.write('add_genre.json', JSON.generate(genres))
    File.write('books.json', JSON.generate(books))
    File.write('labels.json', JSON.generate(labels))
    File.write('games.json', JSON.generate(games))
    File.write('authors.json', JSON.generate(authors))
  end
end
