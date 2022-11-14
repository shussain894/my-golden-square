class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @tracks << track
  end

  def all
    @tracks 
  end
  
  def search_by_title(keyword) # keyword is a string
    # Returns a list of tracks with titles that include the keyword
    @tracks.select do |track|
      track.title.include?(keyword)
    end 
  end
end 