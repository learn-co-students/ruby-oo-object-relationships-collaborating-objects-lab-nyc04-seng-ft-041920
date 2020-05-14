class Song

    attr_accessor :name, :artist
    attr_reader :artist_name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        filename_array = filename.split(" - ")
        song = self.new(filename_array[1])
        # song.artist = Artist.find_or_create_by_name(filename_array[0])
        song.artist_name = filename_array[0]
        song
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end

end