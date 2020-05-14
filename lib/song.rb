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

    def self.new_by_filename(file_name) 
        half_new_song = file_name.split(" - ")   # Separate new_song by (" - ")
        # song_name = hal_new_song[1]     # split half_new_song[1] into another two strings leaving you with ["Black or White"]

        new_song = Song.new(half_new_song[1])              # create a new <Class: Song>
        new_song.artist = Artist.new(half_new_song[0])
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end