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

    def self.new_by_filename(filename)
        file_array = filename.split(" - ")
        new_song = Song.new(file_array[1])
        new_song.artist = Artist.find_or_create_by_name(file_array[0])
        new_song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

end