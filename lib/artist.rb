class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        self.songs << song
    end

    def self.find_artist(name)
        found = nil
        self.all.each do |artist|
            if artist.name == name
                found = artist
            end
        end
        found
    end

    def self.find_or_create_by_name(name)
        artist = self.find_artist(name)
        artist == nil ? self.new(name) : artist
    end

    def print_songs 
        self.songs.each {|song| puts song.name}
    end
end