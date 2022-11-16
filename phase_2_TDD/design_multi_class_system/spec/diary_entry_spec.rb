require 'diary_entry'

RSpec.describe DiaryEntry do
  it "can take entries and return its parameters" do
    entry1 = DiaryEntry.new("title", "contents", "07444444444")
    expect(entry1.title).to eq "title"
    expect(entry1.contents).to eq "contents"
    expect(entry1.mobile).to eq "07444444444"
  end
  it "can return word count" do
    entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
    expect(entry1.word_count).to eq 5
  end
end 