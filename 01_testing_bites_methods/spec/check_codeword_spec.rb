require 'check_codeword'

RSpec.describe "check_codeword method" do
  it "returns 'Correct! Come in.' when input is horse" do
    result = "horse"
    expect(check_codeword(result)).to eq "Correct! Come in." 
  end
  it "returns 'Close, but nope.' when input begins with 'h' aand ends with 'e'" do
    result = "hope"
    expect(check_codeword(result)).to eq "Close, but nope."
  end 
  it "returns 'WRONG!' when input is something else" do
    result = "astronaut"
    expect(check_codeword(result)).to eq "WRONG!"
  end
end