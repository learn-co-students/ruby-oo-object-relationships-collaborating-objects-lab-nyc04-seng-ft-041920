
class Song

    #this class should create songs given each filename (by MP3importer class) and sending the artists name (a string) to the artist class

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    #Michael Jackson - Black or White - pop.mp3

    def self.new_by_filename(filename)
        parsed = filename.split(" - ")
        song = Song.new(parsed[1])
        #parsed = filename.split(" - ")
        # song.artist = parsed[0]
        song.artist = Artist.find_or_create_by_name(parsed[0])
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end