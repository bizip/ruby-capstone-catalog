require_relative '../book'
require_relative '../label'

module HandleBooks
  def add_book
    puts 'publisher:'
    publisher = gets.chomp.to_s
    puts 'cover state: '
    cover_state = gets.chomp.to_s
    puts 'title:'
    title = gets.chomp.to_s
    puts 'author:'
    author = gets.chomp.to_s
    puts 'color:'
    color = gets.chomp.to_s
    book = Book.new(publisher, cover_state, title, author)
    label = Label.new(title, color)
    @books.push(book)
    @labels.push(label)
    puts 'Book added successfully'
  end

  def list_all_books
    if @books.empty?
      puts 'The list is empty'
    else
      @books.each do |book|
        puts "'#{book.title}' by #{book.author}, publisher: #{book.publisher}, cover state: #{book.cover_state}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'The list is empty'
    else
      @labels.each do |label|
        puts "title:#{label.title}, color: #{label.color}"
      end
    end
  end
end
