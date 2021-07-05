class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end

    # files taken from solution branch in order to move on with the problem, need to return to this
    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
      end
    
    def import
    files.each{|f| Song.new_by_filename(f)}
    end
end