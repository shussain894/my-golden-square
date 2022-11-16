require 'diary'
require 'diary_entry'

RSpec.describe "integration" do
  context "after adding entries" do
    it "lists the entries" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my friday", "how it went")
      diary_entry_2 = DiaryEntry.new("my thursday", "went to gym")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end
  end
  
  context "it counts the words" do
    it "counts the words in all entries" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my friday", "how it went")
      diary_entry_2 = DiaryEntry.new("my thursday", "went to gym")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 6
    end
  end

  context "reading time methods" do
    it "fails where wpm is 0" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my friday", "how it went")
      diary.add(diary_entry_1)
      expect{ diary.reading_time(0) }.to raise_error "wpm must be positive"
    end 

    it "returns reading time for entries" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my friday", "how it went")
      diary_entry_2 = DiaryEntry.new("my thursday", "went to gym")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.reading_time(2)).to eq 3
    end
  end 

  context "best entry for reading time" do
    it "returns readable entry" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my friday", "it went")
      diary.add(diary_entry_1)
      result = diary.find_best_entry_for_reading_time(2, 1)
      expect(result).to eq (diary_entry_1)
    end
    it "returns nil for unreadable entry" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my friday", "how it went this week")
      diary.add(diary_entry_1)
      result = diary.find_best_entry_for_reading_time(2, 1)
      expect(result).to eq nil 
    end
    it "returns best readable entry for multiple entries" do
      diary = Diary.new
      best_entry = DiaryEntry.new("title", "this week")
      diary.add(DiaryEntry.new("title", "one"))
      diary.add(best_entry)
      diary.add(DiaryEntry.new("title", "one two three"))
      diary.add(DiaryEntry.new("title", "one two three four"))
      result = diary.find_best_entry_for_reading_time(2, 1)
      expect(result).to eq best_entry
    end
  end 
end 