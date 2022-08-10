require 'json'

class Data
  def initialize
    @files = %w[add_music_album.json]
  end

  def create_files
    @files.each do |file|
      File.new(file, 'w+') unless File.exist?(file)
    end
  end

  def collect_books(album)
    return unless File.exist?('add_music_album.json')

    book_collection = File.open('add_music_album.json', 'w')
    book_collection.write(JSON.generate(album))
    book_collection.close
  end

  def self.load_music_albums
    data = []
    file = './add_music_album.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |album|
      data << MusicAlbum.new(album['name'], album['on_spotify'])
    end
    data
  end
end
