
class Artist

    #this class creats the artist (if it doesnt yet exist), or finds the instance of that artist if it does exist

    attr_accessor :name

    #to be able to store all artist instances in this variable
    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

   def songs
        Song.all.select { |song| song.artist == self }
   end

   def add_song(song)
        song.artist = self
   end

   def self.find_or_create_by_name(name)
        found_artist = @@all.find do |artist|
            artist.name == name
        end

        if found_artist
            found_artist
        else 
            Artist.new(name)
        end
   end

   def print_songs
        songs.each do |song|
            puts song.name
        end
   end

end