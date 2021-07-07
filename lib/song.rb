require('pry')
class Song


    attr_accessor :name, :artist
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

    def self.new_by_filename(file_name)
        file = file_name.split("-")
        
        artist_name = file[0].strip
        song_name = file[1].strip
        #binding.pry
        song = self.new(song_name)
        song.artist_name = artist_name
        return song
    end

    def artist_name=(name)
        #Song.all.select{|song| song.artist == name}
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end
end