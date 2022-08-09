require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @archived = archived
  end

  def can_be_archived?
    if @archived || @cover_state == 'bad'
      true
    else
      false
    end
  end
end

# book = Book.new('n', 'good')
# puts book.can_be_archived?
