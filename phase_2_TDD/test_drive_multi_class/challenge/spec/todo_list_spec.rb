require 'todo_list'

RSpec.describe TodoList do
  it "fails if todo_list is empty" do
    todolist = TodoList.new
    expect{ todolist.incomplete() }.to raise_error "entries cannot be empty"
  end
  it "fails if todo_list is empty" do
    todolist = TodoList.new
    expect{ todolist.complete() }.to raise_error "entries cannot be empty"
  end
end