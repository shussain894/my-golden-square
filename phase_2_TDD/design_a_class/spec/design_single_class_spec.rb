require 'design_single_class'

RSpec.describe TodoList do
  it "returns false as list is empty" do
    todo = TodoList.new 
    expect(todo.list).to eq []
  end 

  it "adds a task to the list" do
    todo = TodoList.new
    todo.add("have medicine")
    expect(todo.list).to eq ["have medicine"]
  end 
  it "adds 2 tasks to the list" do
    todo = TodoList.new
    todo.add("walk the cat")
    todo.add("feed the cat")
    expect(todo.list).to eq ["walk the cat", "feed the cat"]
  end 

  it "removes a task when we complete it" do
    todo = TodoList.new
    todo.add("walk the cat")
    todo.add("feed the cat")
    todo.add("have medicine")
    todo.complete("have medicine")
    expect(todo.list).to eq ["walk the cat", "feed the cat"]
  end 

  it "returns an error as there is no such task" do
    todo = TodoList.new
    todo.add("have medicine")
    expect { todo.complete("wash the car") }.to raise_error "No such task"
  end 
end