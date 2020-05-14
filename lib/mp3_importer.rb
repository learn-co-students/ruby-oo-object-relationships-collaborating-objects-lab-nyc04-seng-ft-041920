require 'pry'

class MP3Importer 

    attr_accessor :path 

    def initialize(path)
        @path = path 
    end 

    def files
       file_names_with_path = Dir[@path +"/*.mp3"]           #gets file name with path 
       file_names = file_names_with_path.map{|x| File.basename(x)}  #get file name without path 
    end 

    def import 
        files.each {|file_name|  Song.new_by_filename(file_name)}
       
    end 
end 