require Item
class MusicAlbum < Item
    attr_accessor :on_spotify
    def initialize(on_spotify)
        super(genre, author, label, publish_date)
        @on_spotify:on_spotify
    end

    def can_be_archived?()
        @archived=true
    end
end