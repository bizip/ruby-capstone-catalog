require 'spec_helper'

describe Book do
  it "returns true if @archived is true or @cover_state equals to 'bad'" do
    book = Book.new('n', 'bad', 'title', 'author')
    expect(book.can_be_archived?).to eql(true)
  end
  it "returns false if @archived is false or @cover_state not equals to 'bad'" do
    book = Book.new('n', 'good', 'title', 'author')
    expect(book.can_be_archived?).to eql(false)
  end
end
