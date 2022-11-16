class Diary
  def initialize
    @entries = []
    @task_list = []
  end

  def entry_store(entry)
    @entries << entry 
  end

  def read_diary(entry)
    entry.contents
  end

  def best_reading_time(wpm, minutes)
    words = wpm * minutes
    readable_entry = @entries.select {|entry| entry.word_count <= words }

    raise "no suitable entries" if readable_entry.empty?
    readable_entry
  end

  def contacts 
    contacts_array = @entries.map {|entry| entry.mobile}
    raise "No contacts" if contacts_array == []
    contacts_array
  end

  def add_task(task)
    @task_list << task
  end

  def task_store
    @task_list
  end
end