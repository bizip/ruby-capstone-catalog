class Item
  attr_accessor :genre, :author, :label, :publish_date, :id, :archived

  def initialize(genre, author, label, publish_date)
    @id = rand(1..100)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def add_label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def move_to_archive
    @archived == can_be_archived?
  end

  private

  def can_be_archived?
    return true if publish_date > 10
  end
end
