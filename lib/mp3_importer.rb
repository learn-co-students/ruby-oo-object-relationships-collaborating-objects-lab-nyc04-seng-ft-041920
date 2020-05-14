require 'pry'

class MP3Importer

    attr_accessor :file_path

    def initialize(file_path)
        @file_path = file_path
    end

    def path
        @file_path
    end
    # binding.pry
    def files
        # mp3_files = Dir.entries(path)             # Loads directory into var as an array :: https://ruby-doc.org/core-2.7.1/Dir.html#method-c-entries
        
        # Dir.each_child(file_path) do |lol|        # Passes the filename of each entry as a parameter to the block https://ruby-doc.org/core-2.7.1/Dir.html#method-c-each_child
        #     puts lol.join("")
        # end

        mp3_files = Dir.children(file_path)         # Creates an array of the given directory's children https://ruby-doc.org/core-2.7.1/Dir.html#method-c-children

        mp3_files.each do |mp3|                     # Enumerate across the entire Array and output the elements
            mp3
        end
    end

    def import
        files.each do |mp3|
            Song.new_by_filename(mp3)               # Creates a new <Class: Song> for each ele in #file with #Song.new_by_filename and the argument as mp3
        end
    end
end