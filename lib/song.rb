class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    # "Michael Jackson - Black or White - pop.mp3"
    # to create a new instance, we want the name
    song_title = file.split(/\s- /) # i love regex
    # self.new(song_title) # but wait, how associate artist?
    new_song = self.new(song_title[1]) # Black or White
    new_song.artist_name = song_title[0] # calls artist_name here, bc that creates an artist instance
    new_song
  end

  def artist_name=(a_name)
    self.artist = Artist.find_or_create_by_name(a_name) # runs logic from THAT method
  end

  # HOW U LIKE ME NOOOOOOOOOOOOOOOW
  # HOW U LIKE ME NOOOOOOOOOOOOOOOOOOOOOOOOW

end
