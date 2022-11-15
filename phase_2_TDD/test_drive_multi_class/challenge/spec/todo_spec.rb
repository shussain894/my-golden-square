require 'todo'

RSpec.describe Todo do
  it "returns added task" do
    todo = Todo.new("feed the cat")
    expect(todo.task).to eq "feed the cat"
  end

  it "returns false when task is initialized" do
    todo = Todo.new("feed the cat")
    expect(todo.done?).to eq false
  end 
  it "returns true when task is done" do
    todo = Todo.new("feed the cat")
    todo.mark_done!
    expect(todo.done?).to eq true 
  end 
end 