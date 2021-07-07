class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name 

    @@all << self
  end

  def self.new_by_filename(filename) 
    parsed_song = filename.split(" - ")
    new_song = Song.new(parsed_song[1])
    new_song.artist = Artist.find_or_create_by_name(parsed_song[0])
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end

  def self.all
    @@all
  end

end