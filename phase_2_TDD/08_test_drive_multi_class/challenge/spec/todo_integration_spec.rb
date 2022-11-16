require 'todo'
require 'todo_list'

RSpec.describe "integration" do
  context "when entries are added" do
    it "returns added task" do
      todolist = TodoList.new
      todo1 = Todo.new("wash the car")
      todolist.add(todo1)
      expect(todolist.incomplete).to eq [todo1]
    end
    it "returns completed task" do
      todolist = TodoList.new
      todo2 = Todo.new("have meds")
      todo2.mark_done!
      todolist.add(todo2)
      expect(todolist.complete).to eq [todo2]
    end 
    it "returns completed tasks" do
      todolist = TodoList.new
      todo1 = Todo.new("feed cat")
      todo2 = Todo.new("go sleep")
      todo1.mark_done!
      todo2.mark_done!
      todolist.add(todo1)
      todolist.add(todo2)
      expect(todolist.complete).to eq [todo1, todo2]
    end 
  end
  context "marks todos as completed" do
    it "marks 1 todo as complete" do
      todolist = TodoList.new
      todo1 = Todo.new("eat dinner")
      todolist.add(todo1)
      todolist.give_up!
      expect(todolist.complete).to eq [todo1]
    end 
    it "marks multiple todos as complete" do
      todolist = TodoList.new
      todo1 = Todo.new("eat breakfast")
      todo2 = Todo.new("take a shower")
      todolist.add(todo1)
      todolist.add(todo2)
      todolist.give_up!
      expect(todolist.complete).to eq [todo1, todo2]
    end 
  end 
end 