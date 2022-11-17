# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

- As a user So that I can record my experiences I want to keep a regular diary

- As a user So that I can reflect on my experiences I want to read my past diary entries

- As a user So that I can reflect on my experiences in my busy day I want to select diary entries to read based on how much time I have and my reading speed

- As a user So that I can keep track of my tasks I want to keep a todo list along with my diary

- As a user So that I can keep track of my contacts I want to see a list of all of the mobile phone numbers in all my diary entries



## 2. Design the Class System

_Also design the interface of each class in more detail._

```ruby
class Diary
def initialize
	@entries = []
	@task_list = []
end

def entry_store(entry)
	# instance of DiaryEntry, @entries <<, takes title and entry
end

def read_diary(entry) # returns contents of diary
	entry.contents
end

def contacts
	contacts_array = @entries.map {|entry| entry.mobile}
  raise "no contacts" if contacts_array == []
  contacts_array
	end
end

def best_reading_time(wpm, minutes)
	# returns longest reading time in given words in minutes
	words = wpm * minutes
  readable_entry = @entries.select {|entry| entry.word_count <= words }

	raise "no suitable entries" if readable_entry.empty?
	readable_entry
	end
end

def add_task
	@task_list << task
end

def task_store # returns list of tasks
	@task_list
end
end

class DiaryEntry
def initialize(title, contents, mobile)
	@title = title
	@contents = contents
	@mobile = mobile
end

def title 
	@title
end

def contents
	@contents
end

def mobile
	@mobile
end

def word_count
	contents.split.length
end
end

class Todo
def initialize(task)
	@task = task
end

def task
	@task
end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

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
			expect(diary.read_diary(entry1)).to eq "mastery"
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

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# unit testing DiaryEntry
RSpec.describe DiaryEntry do
  it "can take entries and return its parameters" do
    entry1 = DiaryEntry.new("title1", "contents1", "07444444444")
    expect(entry1.title).to eq "title"
    expect(entry1.contents).to eq "contents"
    expect(entry1.mobile).to eq "07444444444"
  end
	it "can return word count" do
    entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
    expect(entry1.word_count).to eq 5
  end
end

# unit testing Todo
RSpec.describe Todo do
  it 'constructs' do
    todo1 = Todo.new('task1')
    expect(todo1.task).to eq 'task1'
  end
end

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


