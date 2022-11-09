require 'checking_grammar'


RSpec.describe "check checking_grammar method" do
  it "returns false as string is empty" do
    result = checking_grammar("")
    expect(result).to eq false
  end
  it "returns false as string does not end with punctuation mark" do
    result = checking_grammar("This is good")
    expect(result).to eq false
  end
  it "returns false as string does not begin with a capital letter" do
    result = checking_grammar("this is good!")
    expect(result).to eq false
  end
  it "returns true as string begins with capital letter and ends with sentence-ending punctuation" do
    result = checking_grammar("This is good!")
    expect(result).to eq true
  end
  it "returns true as string begins with capital letter and ends with sentence-ending punctuation" do
    result = checking_grammar("This is good.")
    expect(result).to eq true
  end
  it "returns true as string begins with capital letter and ends with sentence-ending punctuation" do
    result = checking_grammar("This is good?")
    expect(result).to eq true
  end
  
end