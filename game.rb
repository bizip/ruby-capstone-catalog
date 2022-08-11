require_relative 'item'

class Game < Item
  attr_accessor :name_of_game, :multiplayer, :last_played_at, :first_name, :last_name

  def initialize(name_of_game, multiplayer, last_played_at, first_name, last_name)
    super(genre, author, label, publish_date)
    @name_of_game = name_of_game
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @first_name = first_name
    @last_name = last_name
    @archived = archived
  end

  def can_be_archived?
    @archived && @last_played_at > 2
  end
end


