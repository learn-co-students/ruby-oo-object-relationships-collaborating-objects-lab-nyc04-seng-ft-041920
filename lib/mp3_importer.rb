class MP3Importer
  attr_accessor :path, :filenames
 
  def initialize(path)
   @path = path
  end

  def files
    Dir.chdir(@path) do | path |
      self.filenames = Dir.glob("*.mp3")
    end
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

 end