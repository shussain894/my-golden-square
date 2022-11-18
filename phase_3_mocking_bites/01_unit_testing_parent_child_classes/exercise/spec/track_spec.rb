require 'Track'

RSpec.describe Track do
  it "returns true if keyword matches title or artist" do
    track = Track.new("fearless", "taylor swift")
    expect(track.matches?("taylor")).to eq true
  end
  it "returns true if keyword matches title or artist" do
    track = Track.new("fearless", "taylor swift")
    expect(track.matches?("fearless")).to eq true
  end
  it "returns false if keyword matches title or artist" do
    track = Track.new("fearless", "taylor swift")
    expect(track.matches?("bob")).to eq false
  end
end 