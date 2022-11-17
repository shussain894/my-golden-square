require 'music_library'

RSpec.describe MusicLibrary do
  context "adding tracks to the array" do
    it "returns an empty array" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end

    it "adds and returns a track" do
      music_library = MusicLibrary.new
      fake_track = double :fake_track_entry
      music_library.add(fake_track)
      expect(music_library.all).to eq [fake_track]
    end
  end 

  context "returns tracks with the keyword" do
    it "returns empty array if theres no entry" do
      music_library = MusicLibrary.new
      expect(music_library.search("lovebug")).to eq []
    end 

    it "returns 2 tracks with the keyword" do
      music_library = MusicLibrary.new
      fake_track1 = double :fake_track_entry, matches?: true
      fake_track2 = double :fake_track_entry, matches?: true
      fake_track3 = double :fake_track_entry, matches?: false
      music_library.add(fake_track1)
      music_library.add(fake_track2)
      music_library.add(fake_track3)
      expect(music_library.search("lovebug")).to eq [fake_track1, fake_track2]
    end
  end 
end 