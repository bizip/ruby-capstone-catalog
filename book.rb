require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :title, :author

  def initialize(publisher, cover_state, title, author)
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @title = title
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
