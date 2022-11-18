require 'diary'

RSpec.describe Diary do
  it "provides contents and reads" do
    diary = Diary.new("more contents")
    expect(diary.read).to eq "more contents"
  end
end 