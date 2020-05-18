require 'pry'

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
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(name)
        name.artist = self
    end

    def self.find_name(name)
        self.all.find do |artist|
            artist.name == name
        end
    end

    def self.find_or_create_by_name(name)
        if self.find_name(name) == nil
            create_artist = Artist.new(name)
            create_artist
        else
            self.find_name(name)
        end
    end

    def print_songs
        song_names = songs.collect do |song|
            puts song.name
        end
    end

end