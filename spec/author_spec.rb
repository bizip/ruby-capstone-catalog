require_relative '../author'

describe Author do
  before :each do
    @author = Author.new('Ghi', 'Ishi')
    @item = Item.new('genre', 'author', 'label', 10)
  end

  describe '#new' do
    it 'Creates Author' do
      @author.should be_an_instance_of Author
    end
  end

  describe '#add_item' do
    it 'It should add new item' do
      expect(@author.add_item(@item)).should eql? @item
    end
  end
end
