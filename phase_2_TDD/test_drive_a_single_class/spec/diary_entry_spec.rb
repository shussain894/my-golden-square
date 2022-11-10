require "diary_entry"

RSpec.describe DiaryEntry do
  it "Adds a title as a string" do
    diary = DiaryEntry.new("A Title", "Some content")
    expect(diary.title).to eq "A Title"
    expect(diary.contents).to eq "Some content"
  end

  it "Returns the number of words in the contents as an integer" do
    diary_entry = DiaryEntry.new("A Title", "Some content")
    expect(diary_entry.count_words).to eq 2
  end

  it "Returns the number of wpm that a user can read" do
    diary_entry = DiaryEntry.new("A Title", "content " * 200)
    expect(diary_entry.reading_time(200)).to eq 1
  end
end