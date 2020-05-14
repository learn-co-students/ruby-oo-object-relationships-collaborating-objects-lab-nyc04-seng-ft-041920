class Artist

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def name=(name)
        @name = name
    end

    def self.all 
        @@all
    end

    def songs
        Song.all.select do |song|
            Song.all if song.artist == self # Returns song.artist if it returns true as the new array for @@all
        end
    end

    def add_song(song_name)
        song_name.artist = self if song_name.name
    end

    #Main function
    def self.find_or_create_by_name(artist)
        if self.find(artist)
            self.find(artist)
        else
            self.new(artist)
        end
    end

    def self.find(name)
        self.all.detect do |artist|
             artist.name == name
        end
    end

    def artist_name=(artist)
        if self.name == artist
            Song.name = self
        else
            new_artist = Artist.new(artist)
            Song.name = new_artist
        end                                                           
    end

    def print_songs
        Song.all.collect do |song|
            puts song.name if song.artist == self
        end
    end

end