require 'json'

class Data
  def initialize
    @files = %w[add_music_album.json add_genre.json]
  end

  def create_files
    @files.each do |file|
      File.new(file, 'w+') unless File.exist?(file)
    end
  end

  def collect_albums(album)
    return unless File.exist?('add_music_album.json')

    album_collection = File.open('add_music_album.json', 'w')
    album_collection.write(JSON.generate(album))
    album_collection.close
  end

  def collect_genre(genre)
    return unless File.exist?('add_genre.json')

    genre_collection = File.open('add_genre.json', 'w')
    genre_collection.write(JSON.generate(genre))
    genre_collection.close
  end

  def self.load_music_albums
    data = []
    file = './add_music_album.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |album|
      data << MusicAlbum.new(album['name'], album['on_spoify'])
    end
    data
  end

  def self.load_genre
    data = []
    file = './add_genre.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |genre|
      data << MusicAlbum.new(genre['name'], genre['on_spotify'])
    end
    data
  end
end
