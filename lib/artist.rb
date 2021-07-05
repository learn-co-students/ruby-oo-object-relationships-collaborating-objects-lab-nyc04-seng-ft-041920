require_relative 'song.rb'

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

    def add_song(song)
        song.artist = self
    end
    
    #lists all songs that belong to this artist
    def songs
        Song.all.select do |song|
            self == song.artist
        end
    end

    def self.find_or_create_by_name(artist_name)
       found_artist = @@all.find {|artist| artist.name == artist_name}
        if !found_artist 
            self.new(artist_name)
        else
            found_artist
        end
    end

    def print_songs
        Song.all.each do |item|
            if self == item.artist 
                puts item.name
            end
        end
    end 

end

savage = Song.new("Savage")
say_so = Song.new("Say So")
moo = Song.new("Moo")
hot_girl_summer = Song.new("Hot Girl Summer")

meg = Artist.new("Megan Thee Stallion")
doja = Artist.new("Doja Cat")

meg.add_song(savage)
meg.add_song(hot_girl_summer)

doja.add_song(say_so)
doja.add_song(moo)

doja.print_songs

# p Artist.find_or_create_by_name("Nicki Minaj")


