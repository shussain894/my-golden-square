require "diary"
require "todo"
require "diary_entry"

RSpec.describe "Integration" do
  context "store and retrieve diary entries" do
    it "can store and retrieve a single entry" do
      diary = Diary.new
			entry1 = DiaryEntry.new("title", "contents", "07111111111")
			diary.entry_store(entry1)
			expect(diary.read_diary(entry1)).to eq "contents"
		end
    it "can store and retrieve multiple entries" do
			diary = Diary.new
			entry1 = DiaryEntry.new("monday", "makers", "07222222222")
			entry2 = DiaryEntry.new("tuesday", "mastery", "07333333333")
			diary.entry_store(entry1)
			diary.entry_store(entry2)
			expect(diary.read_diary(entry1)).to eq "makers"
			expect(diary.read_diary(entry2)).to eq "mastery"
		end
  end

  context "store entries and read them based on time" do
		it "fails when no possible entry" do
			diary = Diary.new
			entry1 = DiaryEntry.new("title", "2 4 6 8 10", "07111111111")
			diary.entry_store(entry1)
			expect{ diary.best_reading_time(3, 1) }.to raise_error "no suitable entries"
		end
    it "fails when wpm is 0" do
			diary = Diary.new
			entry1 = DiaryEntry.new("title", "1 3 5 ", "07111111111")
			diary.entry_store(entry1)
			expect{ diary.best_reading_time(0, 1) }.to raise_error "no suitable entries"
		end
    it "can retrieve best entry when only one possible readable entry" do
			diary = Diary.new
			entry1 = DiaryEntry.new("title1", "1 2 3", "07999999999")
			entry2 = DiaryEntry.new("title2", "1 2 3 4 5 6", "07888888888")
			diary.entry_store(entry1)
			diary.entry_store(entry2)
			expect(diary.best_reading_time(3,1)).to eq [entry1]
		end
    it "can retrieve best entry for multiple possible entries" do
			diary = Diary.new
			entry1 = DiaryEntry.new("title1", "1 2 3", "07999999999")
      entry2 = DiaryEntry.new("title2", "4 5 6", "07888888888")
			entry3 = DiaryEntry.new("title3", "7 8 9 10", "07777777777")
			diary.entry_store(entry1)
			diary.entry_store(entry2)
			diary.entry_store(entry3)
			expect(diary.best_reading_time(3,1)).to eq [entry1, entry2]
		end
  end 

  context "can return mobile numbers" do
    it 'returns error for no contacts' do
      diary = Diary.new
      expect {diary.contacts}.to raise_error "No contacts"
    end
    it "returns the only mobile number" do
			diary = Diary.new
			entry1 = DiaryEntry.new("title", "1 2 3 4 5", "07123456789")
			diary.entry_store(entry1)
			expect(diary.contacts).to eq ["07123456789"]
		end
    it "returns multiple mobile numbers" do
			diary = Diary.new
			entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07123456789")
			entry2 = DiaryEntry.new("title2", "6 7 8 9", "07987654321")
			diary.entry_store(entry1)
			diary.entry_store(entry2)
			expect(diary.contacts).to eq ["07123456789", "07987654321"]
		end
  end 

  context "store and retrieve todo list" do
		it "can store and retrieve one task" do
			diary = Diary.new
			task1 = Todo.new("feed cat")
			diary.add_task(task1)
			expect(diary.task_store).to eq [task1]
		end
    it "can store and retrieve multiple tasks" do
			diary = Diary.new
			task1 = Todo.new("feed cat")
			task2 = Todo.new("bathe")
			diary.add_task(task1)
			diary.add_task(task2)
			expect(diary.task_store).to eq [task1, task2]
		end
  end 
end 
