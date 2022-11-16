require 'diary'

RSpec.describe Diary do 
  context "diary entries" do 
    it "returns empty array" do
      diary = Diary.new()
      expect(diary.all).to eq []
    end
    it "returns list when entry is added" do
      diary = Diary.new
      diary.add("makers")
      expect(diary.all).to eq ["makers"]
    end 
    it "returns list when entries are added" do
      diary = Diary.new
      diary.add("makers")
      diary.add("monday")
      expect(diary.all).to eq ["makers", "monday"]
    end 
  end 
    it "returns word count of zero" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end  

    it "has a reading time of 0" do
      diary = Diary.new
      expect(diary.reading_time(2)).to eq 0
    end

    it "has a best readable entry of nil" do
      diary = Diary.new
      expect(diary.find_best_entry_for_reading_time(2, 1)).to eq nil 
    end
end 