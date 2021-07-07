require('pry')
class MP3Importer
    attr_reader :path
    def initialize(path)
        @path = path
        
    end
    
    def files


        ######help from Bashir
        #gets file name with path
        #Dir.glob( pattern("string format"), [flags], [base: path] ) → array
        #Note that the pattern is not a regexp, it's closer to a shell glob. 
        #in pattern * = regex"/ .* /"" --> means all regular file
        #           *. --> means match all file END with '.' in our case we want '.mp3'
        file_names_with_path = Dir.glob("*.mp3", base: @path)
        #binding.pry
        
        #get file name without path 
        file_names = file_names_with_path.map{|x| File.basename(x)}  
        

        ######found on overstock.
        ######link: https://stackoverflow.com/questions/46575228/how-to-normalise-the-filename-to-just-the-mp3-filename-with-no-path-ruby
        # filenames = Dir.(@path) do | path |
        #     #            puts path
        #                 Dir.glob("*.mp3")
        #             end
        # #puts "names=#{filenames}"
        # filenames


    end

    def import
        files.each{|file| Song.new_by_filename(file)}
    end
end