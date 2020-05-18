require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize name
    @name = name
    @@all << self
  end

  def artist= artist_obj
    @artist = artist_obj
  end

  def self.all
    @@all
  end

  def self.new_by_filename file_input
    file_arr = file_input.split(' - ')
    file_artist = file_arr[0]
    file_name = file_arr[1]
    file_genre = file_arr[2].chomp('.mp3')

    new_song_instance = self.new(file_name)
    # create a instance of Artist class
    artist_instance = Artist.new(file_artist)
    new_song_instance.artist = artist_instance
    new_song_instance
    # binding.pry
  end

  def artist_name= name_str
    artist_instance = Artist.find_or_create_by_name(name_str)
    # binding.pry
    self.artist = artist_instance
    artist_instance.add_song(self)
    # binding.pry
  end

end
