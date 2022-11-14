require 'music_challenge'

RSpec.describe SongList do
  it "returns an empty array" do
    song = SongList.new
    song.add("")
    expect(song.list).to eq [""]
  end

  it "returns a song in the array" do
    song = SongList.new
    song.add("Fearless")
    expect(song.list).to eq ["Fearless"]
  end

  it "adds two songs to the array" do
    song = SongList.new
    song.add("Midnight Rain")
    song.add("Anti-Hero")
  end
end 
