require_relative '../game'

describe Game do
  before :each do
    @game = Game.new('mortal', 'y', 3, 'gh', 'ish')
  end
  describe '#new' do
    it 'Creates a new game' do
    @game = Game.new('Ishi', 3)
  end
  describe '#new' do
    it 'Creates a new music album instance' do
    it 'Creates a new game' do
      @game.should be_an_instance_of Game
    end
  end
  describe '#can_be_archived' do
    it 'It should reurn false if archived is not equals to true and last_played_at > 2' do
      expect(@game.can_be_archived?).to eql false
    it 'It should reurn true if archived is  equals true and last_played_at > 2' do
      expect(@game.can_be_archived?).to eql true
    end
  end
end
