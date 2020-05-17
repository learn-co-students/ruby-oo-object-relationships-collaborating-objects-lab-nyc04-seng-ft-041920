require "pry"
require "artist.rb"
require "mp3_importer.rb"

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
  #
  # def artist_name=(artist)
  # @artist = artist
  # end

  def self.new_by_filename(song)
    song = song[0..song.length - 5]
    song = song.split("-")
    artist = song[0][0..-2]
    song = song[1][1..-2]
    new_song = self.new(song)
    art = Artist.find_or_create_by_name(artist)
    new_song.artist = art
    new_song
    # binding.pry
  end

  def artist_name=(name)
    new_art = Artist.find_or_create_by_name(name)
    self.artist = new_art
  end
end

# y = Song.new("Yoshi")
# binding.pry
