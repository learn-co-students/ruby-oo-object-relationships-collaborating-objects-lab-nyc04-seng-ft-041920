class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries("./spec/fixtures/mp3s").select do |file| 
            !File.directory? file
        end
    end

    def import 
        files.count.times do 
            Song.new_by_filename(files)
        end
    end

end