require 'diary'

RSpec.describe "check make_snippet method" do
  context "given an empty string" do
    it "returns an empty string" do
      result = make_snippet("")
      expect(result).to eq ""
    end
  end
    it "returns 'rocket'" do
      result = make_snippet("rocket")
      expect(result).to eq "rocket"
    end
    it "returns 'up', 'down', 'left', 'right', 'back', 'forward'" do
      result = make_snippet("up, down, left, right, back, forward")
      expect(result).to eq "up, down, left, right, back..."
    end
    it "returns 'up', 'down', 'left', 'right', 'back...'" do
      result = make_snippet("up, down, left, right, back, forward")
      expect(result).to eq "up, down, left, right, back..."
    end
end

RSpec.describe "check count_words method" do
  it "returns length of string" do
    result = count_words("")
    expect(result).to eq 0
  end
  it "returns 1 if there is only 1 word in the method" do
    result = count_words("rocket")
    expect(result).to eq 1
  end
  it "returns 5 if there are 5 words in the method" do
    result = count_words("rocket, astronaut, space, ship, ball")
    expect(result).to eq 5
  end

end 