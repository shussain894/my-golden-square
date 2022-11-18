require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  it "adds tasks to a list" do
    task_list = TaskList.new
    fake_task_1 = double :fake_task_entry
    fake_task_2 = double :fake_task_entry
    task_list.add(fake_task_1)
    task_list.add(fake_task_2)
    expect(task_list.all).to eq [fake_task_1, fake_task_2]
  end
  it "marks tasks as complete" do
    task_list = TaskList.new
    fake_task_1 = double :fake_task_entry, complete?: true 
    fake_task_2 = double :fake_task_entry, complete?: true
    task_list.add(fake_task_1)
    task_list.add(fake_task_2)
    expect(task_list.all_complete?).to eq true
  end
end
