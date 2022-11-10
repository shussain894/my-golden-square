require 'string_builder'

RSpec.describe StringBuilder do
  it "returns astronauts" do
    builder = StringBuilder.new
    builder.add("astronauts")
    result = builder.output
    expect(result).to eq "astronauts"
  end 
  it "returns 10" do
    builder = StringBuilder.new
    builder.add("astronauts")
    result = builder.size
    expect(result).to eq 10
  end 
  it "returns astronauts" do
    builder = StringBuilder.new
    builder.add("astronauts")
    builder.add("rocket")
    result = builder.output
    expect(result).to eq "astronautsrocket"
  end 
end