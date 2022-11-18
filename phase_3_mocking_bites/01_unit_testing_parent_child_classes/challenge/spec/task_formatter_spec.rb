require 'task_formatter'

RSpec.describe TaskFormatter do
  context "returns the task formatted as a string" do
    it "returns task as incomplete" do
      task = double(:task, title: "go shopping", complete?: false)
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq "- [ ] go shopping"
    end
    it "returns task as complete" do
      task = double(:task, title: "go shopping", complete?: true)
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq "- [x] go shopping"
    end
  end
end 

