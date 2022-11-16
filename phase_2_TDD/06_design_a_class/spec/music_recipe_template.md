# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

_Put or write the user story here. Add any clarifying notes you might have._

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

*MINE*

class SongList
def initialize
@songs = []
end

def list
@songs
end

def add(song)
@songs << song
end

 
end

```ruby
# EXAMPLE

class Reminder
  def initialize(name) # name is a string
    # ...
  end

  def remind_me_to(task) # task is a string
    # No return value
  end

  def remind()
    # Throws an exception if no task is set
    # Otherwise, returns a string reminding the user to do the task
  end
end
```

## 3. Create Examples as Tests

*MINE*

song = SongList.new
song.add() => false

song = SongList.new
song.add("Fearless")
song.list => ["Fearless"]

song = SongList.new
song.add("Midnight Rain")
song.add("Anti-Hero")
song.list => ["Midnight Rain", "Anti-Hero"]


```ruby
# EXAMPLE

# 1
reminder = Reminder("Kay")
reminder.remind_me_to("Walk the dog")
reminder.remind() # => "Walk the dog, Kay!"

# 2
reminder = Reminder("Kay")
reminder.remind() # fails with "No task set."

# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---
