require './modules/book_module'
require_relative './book'
require_relative './label'
require 'json'

class App
  include HandleBooks

  def initialize
    @books = []
    @labels = []
    load_data
  end

  def load_data
    if File.empty?('books.json')
      puts 'List is empty'
    else
      books = JSON.parse(File.read('books.json'))
      books.each do |book|
        @books.push(Book.new(book['publisher'], book['cover_state'], book['title'], book['author']))
      end
    end
    if File.empty?('labels.json')
      pust 'List is empty'
    else
      labels = JSON.parse(File.read('labels.json'))
      labels.each do |label|
        @labels.push(Label.new(label['title'], label['color']))
      end
    end
  end

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
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
      list_all_labels
      menu
    when '6'
      list_all_authors
    when '7'
      add_book
      menu
    when '8'
      add_music_album
    when '9'
      add_game
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

  def save_data
    books = []
    labels = []
    @books.each do |book|
      books.push({ title: book.title, author: book.author, cover_state: book.cover_state, publisher: book.publisher })
    end
    @labels.each do |label|
      labels.push({ title: label.title, color: label.color })
    end

    File.write('books.json', JSON.generate(books))
    File.write('labels.json', JSON.generate(labels))
  end
end