require 'pry'
class Artist 

        @@all = []
        attr_accessor :name 

        def initialize(name)
            @name = name 
            @@all << self 
        end

        def self.all 
            @@all 
        end 

        def add_song(song)
            song.artist = self
        end 

        def songs 
           arr = Song.all.select {|song| song.artist == self}
        end 

        def self.find_or_create_by_name(name)
            found_artist = @@all.find{|artist| artist.name == name}
            status = found_artist ? found_artist : Artist.new(name)
        end 

        def print_songs 
            songs.each{|song| puts song.name}
        end 
end 