require_relative './item.rb'


class Genre < Item
    attr_accessor :name
    attr_reader :items
    def initialize(name)
        @id= rand(1..1000)
        @name= name
        @items= []
    end
    
    def add_item(item)
        @items << self
    end

    def display_item
        puts @item
    end

end