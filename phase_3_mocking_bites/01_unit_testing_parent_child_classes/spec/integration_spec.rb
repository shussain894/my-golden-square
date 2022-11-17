require 'music_library'
require 'track'

RSpec.describe "integration" do
  it "adds a track and returns it" do
    music_library = MusicLibrary.new
    track1 = Track.new("lovebug", "jonas brothers")
    music_library.add(track1)
    expect(music_library.all).to eq [track1]
  end

  it "returns tracks with keywords" do
    music_library = MusicLibrary.new
    track1 = Track.new("lovebug", "jonas brothers")
    track2 = Track.new("jonas brothers", "lovebug is my song")
    track3 = Track.new("jonas brothers", "music is my song")
    music_library.add(track1)
    music_library.add(track2)
    music_library.add(track3)
    expect(music_library.search("lovebug")).to eq [track1, track2]
  end 
end 
