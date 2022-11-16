class SongList
  def initialize
    @songs = []
  end 

  def add(song)
    @songs << song
  end

  def list
    @songs
  end

end