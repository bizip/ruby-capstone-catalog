class MusicAlbum
    attr_accessor :on_spotify
    def initialize(on_spotify)
        @on_spotify:on_spotify
    end

    def can_be_archived
        @archived=true
    end
end