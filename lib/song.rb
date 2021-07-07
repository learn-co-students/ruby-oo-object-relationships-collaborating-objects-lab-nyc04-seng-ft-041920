class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist=(name)
        @artist = name
        @artist.songs << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        data = filename.split("-")
        song = self.new(data[1].strip)
        song.artist = Artist.find_or_create_by_name(data[0].strip)
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end