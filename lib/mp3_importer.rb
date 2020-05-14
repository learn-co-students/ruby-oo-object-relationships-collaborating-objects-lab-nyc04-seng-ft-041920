require 'pry'
class MP3Importer
    
    attr_accessor :path, :files

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries("spec/fixtures/mp3s").select {|file| file.end_with?(".mp3")    }
    end

    # iterate through the files array and send each to Song.new_by_filename
    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end