require_relative '../game'

describe Game do
  before :each do
<<<<<<< HEAD
    @game = Game.new('mortal combat', 3)
=======
    @game = Game.new('Ishi', 3)
>>>>>>> 15ba3ea6092e2a6e502da20e55b93c5d0424072a
  end
  describe '#new' do
    it 'Creates a new game' do
      @game.should be_an_instance_of Game
    end
  end
  describe '#can_be_archived' do
<<<<<<< HEAD
    it 'It should reurn false if archived is not equals true and last_played_at > 2' do
      expect(@game.can_be_archived?).to eql false
=======
    it 'It should reurn true if archived is  equals true and last_played_at > 2' do
      expect(@game.can_be_archived?).to eql true
>>>>>>> 15ba3ea6092e2a6e502da20e55b93c5d0424072a
    end
  end
end
