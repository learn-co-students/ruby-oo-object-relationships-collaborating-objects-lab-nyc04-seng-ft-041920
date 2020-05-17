require "pry"

class Artist
  attr_accessor :name
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

  def songs
    songs = []
    Song.all.select do |song_list|
      # binding.pry
      if song_list.artist == self
        songs << song_list
      end
    end
    songs
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(artist_name)
    if self.all.find { |art| art.name == artist_name } == nil
      self.new(artist_name)
    else
      self.all.find { |art| art.name == artist_name }
    end
  end

  def print_songs
    self.songs.each { |song| puts song.name }
  end
end
