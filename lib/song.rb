require 'pry'

class Song 
    @@all = []
    @@tempObject
    attr_accessor :name, :artist 

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def artist_name=(name)
       artist_object =  Artist.find_or_create_by_name(name)    #Setter somehow always returns the passed in value 
       @@tempObject = artist_object                            #I couldn't return this value in any other way 
       self.artist = artist_object
    end 


    def self.new_by_filename(file_name)
        parsed_name = file_name.split(" - ")
        new_song = Song.new(parsed_name[1])
       # found_artist = new_song.artist_name(parsed_name[0])
        new_song.artist_name = parsed_name[0]
        new_song.artist = @@tempObject
        new_song 

    end 



end 