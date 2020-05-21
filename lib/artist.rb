class Artist
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name

    @@all << self
  end

  def self.find_or_create_by_name(name)
    found_artist = @@all.find{|artist| artist.name == name}
    status = found_artist ? found_artist : Artist.new(name)
  end 

  def songs 
    Song.all.select do |song|
      song.artist == self
    end
  end

  def add_song(song)
    song.artist = self
  end

  def print_songs
    p_songs = []
    Song.all.each do |song|
      if song.artist == self
        puts song.name
        p_songs << song.name
      end
    end
    p_songs
  end

  def self.all
    @@all
  end
end