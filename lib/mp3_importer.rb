
class MP3Importer

    #this class should parse all the filenames in the spec/fixtures folder and send the filenames to the Song class

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    #not sure how this works but...
    def files
        Dir.entries("./spec/fixtures/mp3s").select do |file|
            !File.directory? file
        end
    end
    
    def import
        files.length.times do
        Song.new_by_filename(files)
        end
    end

end