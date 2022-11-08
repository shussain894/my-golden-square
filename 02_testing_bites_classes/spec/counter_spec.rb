require 'counter.rb'

RSpec.describe Counter do
  it "Counted to 10 so far" do
    counter = Counter.new
    counter.add(10)
    result = counter.report
    expect(result).to eq "Counted to 10 so far."
  end
  it "counted two numbers to 15" do
    counter = Counter.new
    counter.add(10)
    counter.add(5)
    result = counter.report
    expect(result).to eq "Counted to 15 so far."
  end
end