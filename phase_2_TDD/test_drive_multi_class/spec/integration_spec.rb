require 'music_library'
require 'track'

RSpec.describe "integration" do
  context "when we add a track" do
    it "comes back in the list" do
      music_library = MusicLibrary.new
      track_1 = Track.new("fearless", "taylor swift")
      track_2 = Track.new("amilli", "lil wayne")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end

  context "with some tracks added" do
    it "searches for those tracks by full title" do
      music_library = MusicLibrary.new
      track_1 = Track.new("fearless", "taylor swift")
      track_2 = Track.new("amilli", "lil wayne")
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search_by_title("amilli")
      expect(result).to eq [track_2]
    end
    it "searches for those tracks by partial title" do
      music_library = MusicLibrary.new
      track_1 = Track.new("fearless", "taylor swift")
      track_2 = Track.new("amilli", "lil wayne")
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search_by_title("title_2")
      expect(result).to eq [track_2]
    end

    context "where there are no natching tracks" do
      it "yields an empty list" do
        music_library = MusicLibrary.new
        track_1 = Track.new("fearless", "taylor swift")
        track_2 = Track.new("amilli", "lil wayne")
        music_library.add(track_1)
        music_library.add(track_2)
        result = music_library.search_by_title("george")
        expect(result).to eq []
      end
    end
  end 
end 