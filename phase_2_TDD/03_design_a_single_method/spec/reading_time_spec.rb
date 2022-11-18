require 'reading_time'

RSpec.describe "check reading_time" do
  it "returns 0 as no words put into the method" do 
    result = reading_time("")
    expect(result).to eq 0
  end
  it "returns 1 as 'two hundred' words is input into the method" do
    result = reading_time("one " * 200)
    expect(result).to eq 1
  end
  it "returns 3 as 'five hundred' words is input into the method" do
    result = reading_time("one " * 500)
    expect(result).to eq 3
  end
  it "returns 5 as 'one thousand' words is input into the method" do
    result = reading_time("one " * 1000)
    expect(result).to eq 5
  end
  
  
end