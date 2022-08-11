require_relative '../music_album'
require_relative '../genre'

module CreateMusicAlbum
  def add_music_album
    puts 'What is the name of your album'
    name = gets.chomp
    puts 'What is the genre of you album'
    gnr = gets.chomp
    puts 'Is your album on spottify [Y/N]'
    on_spotify = false
    is_on_spotify = gets.chomp
    on_spotify = true if is_on_spotify == 'Y'
    music = MusicAlbum.new(name, on_spotify)
    genre = Genre.new(gnr)
    puts 'Album created!'

    @music_albums.push(music)
    @genres.push(genre)
    menu
  end


  def list_all_music_albums
    if File.empty?('add_music_album.json')
      puts 'List of music album is empty'
    else
      albums = JSON.parse(File.read('add_music_album.json'))
      albums.each do |album|
        @music_albums << MusicAlbum.new(album['name'], album['on_spoify'])
      end
    end
  end

end
