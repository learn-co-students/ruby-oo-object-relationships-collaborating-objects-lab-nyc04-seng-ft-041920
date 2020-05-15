class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(str)
    artist = self.all.find {|artist| artist.name == str}
    artist ? artist : self.new(str)
  end

  def print_songs
    # spec looks like you need to print it line by line, with \n
    # can use #songs for this!
    songs.map { |song| puts song.name }
  end


end
