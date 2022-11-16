require 'diary_entry'

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("mastery", "tuesday")
    expect(diary_entry.title).to eq "mastery"
    expect(diary_entry.contents).to eq "tuesday"
  end

  context "word count" do
    it "returns zero when array is empty" do
      diary_entry = DiaryEntry.new("title", "")
      expect(diary_entry.count_words).to eq 0
    end
    it "#counts_words" do
      diary_entry = DiaryEntry.new("title", "one two three four")
      expect(diary_entry.count_words).to eq 4
    end
  end 

  context "reading time" do
    it "fails if wpm is 0" do
      diary_entry = DiaryEntry.new("title", "contents")
      expect { diary_entry.reading_time(0) }.to raise_error "wpm must be positive"
    end

    it "returns zero when contents is empty" do
      diary_entry = DiaryEntry.new("title", "")
      expect(diary_entry.reading_time(2)).to eq 0
    end
    it "returns a reading time" do
      diary_entry = DiaryEntry.new("title", "one two three four")
      expect(diary_entry.reading_time(2)).to eq 2
    end
  end 
end 