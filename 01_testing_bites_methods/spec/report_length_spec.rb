require 'report_length'

RSpec.describe "check report_length" do
  it "'This string was 5 characters long.'" do
    result = "chris"
    expect(report_length(result)).to eq "This string was 5 characters long."
  end
  it "'This string was 10 characters long.'" do
    result = "astronauts"
    expect(report_length(result)).to eq "This string was 10 characters long."
  end
  it "'This string was 0 characters long.'" do
    result = ""
    expect(report_length(result)).to eq "This string was 0 characters long."
  end
  it "'This string was 3 characters long.'" do
    result = "   "
    expect(report_length(result)).to eq "This string was 3 characters long."
  end
end 
