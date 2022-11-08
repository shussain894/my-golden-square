require 'greet'

RSpec.describe "check greet" do
  it "returns 'Hello, shah!'" do 
    result = "shah"
    expect(greet(result)).to eq "Hello, shah!"
  end
  it "returns 'Hello, Chris!'" do 
    result = "Chris"
    expect(greet(result)).to eq "Hello, Chris!"
  end
end 