require_relative '../lib/song.rb'
require 'pry'
class Artist
  attr_accessor :name
  @@all = []

  def initialize name
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select do |song_instance|
      song_instance.artist == self
    end
  end

  def add_song song_obj
    # binding.pry
    song_obj.artist = self
  end

  def self.find_or_create_by_name name
    # binding.pry
    # first we need to create a local varto store if the artist is inside the Class var of Artist. we use the find enumerable to find the artist is either going to return the artist instance or nil if it does not find it
      is_artist_found = self.all.find{|artist_ins| artist_ins.name == name}
      # here we do an if statement to see if we should create an instance or simply return the instance that was found. we can also write with the ternary operator but i like it this way.
      if is_artist_found
        is_artist_found
      else
        Artist.new(name)
      end
    end

  def print_songs
    songs_str = ""
    self.songs.each do |songs_ins|
      songs_str += songs_ins.name
      songs_str += "\n"
    end
    # binding.pry
    puts songs_str
  end


end


# artist = Artist.new("michael")

# song_one = Song.new("Rock With You")
# song_two = Song.new("Smooth Criminal")

# artist.add_song(song_one)
# artist.add_song(song_two)

# p artist.songs


