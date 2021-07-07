require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        wd = Dir.pwd
        Dir.chdir(self.path)
        file_array = Dir.glob("*.mp3")
        Dir.chdir(wd)
        file_array
    end

    def import
        self.files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end

# test_music_path = "./spec/fixtures/mp3s"
# mp3 = MP3Importer.new(test_music_path)
# binding.pry