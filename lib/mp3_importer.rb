class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # i learned a thing here from stackoverflow
    # https://ruby-doc.org/core-2.5.0/Dir.html
    Dir.chdir(@path) do # CD's into the dir of path passed in
        # https://ruby-doc.org/core-2.5.1/Dir.html#method-c-glob
        Dir.glob("*.mp3") # checks every file (*) to match the pattern str mp3
    end
  end

  def import
    files.collect do |song|
      Song.new_by_filename(song)
    end
  end

end
