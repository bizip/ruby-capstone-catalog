require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(genre, author, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = archived
  end

  def can_be_archived?
    @archived && @last_played_at > 2
  end
end

# game = Game.new('Ishi', 3)
# puts game.can_be_archived?
