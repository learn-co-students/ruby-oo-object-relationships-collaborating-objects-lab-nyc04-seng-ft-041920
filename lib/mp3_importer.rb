class MP3Importer

  attr_reader :path

  def initialize path_input
    @path = path_input
  end

  def files
    # binding.pry
    files_arr = Dir.new("./#{@path}").select do |file|
      file.length > 2
    end
    files_arr
  end

  def import
    self.files.each do |song_unparsed|
      Song.new_by_filename song_unparsed
    end
  end

end
