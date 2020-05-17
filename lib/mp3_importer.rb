class MP3Importer
  attr_accessor :path
  @@all = []

  def initialize(path)
    @path = path
    save
  end

  def save
    @@all << self
  end

  def files
    mp3s = []
    Dir.entries(path).map do |file|
      file[-4..-1] == ".mp3" ? mp3s << file : nil
    end
    mp3s
  end

  def import
    new_song = []
    self.files.each do |song|
      temp = Song.new_by_filename(song)
      new_song << temp
      # binding.pry
    end
  end
end
