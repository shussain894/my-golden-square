require 'TODO'

RSpec.describe "check todo_check method" do
  it "returns false as its an empty string" do
    result = todo_check("")
    expect(result).to eq false
  end
  it "returns false as string does not contain '#TODO'" do
    result = todo_check("todo")
    expect(result).to eq false
  end
  it "returns false as string is given multiple words but does not contain '#TODO'" do
    result = todo_check("this is my todo")
    expect(result).to eq false
  end
  it "returns true as string contains '#TODO'" do
    result = todo_check("#TODO")
    expect(result).to eq true
  end
  it "returns true as string contains multiple words and '#TODO'" do
    result = todo_check("this is my #TODO")
    expect(result).to eq true
  end
end