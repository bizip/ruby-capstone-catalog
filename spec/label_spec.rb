require 'spec_helper'

describe Label do
  it 'add item method should add new item' do
    item = Item.new('genre', 'author', 'label', 10)
    label = Label.new('Harry Potter', 'green')
    expect(label.add_item(item)).to eql(label)
  end
end