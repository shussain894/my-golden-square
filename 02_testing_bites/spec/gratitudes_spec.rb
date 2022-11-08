require 'gratitudes'

RSpec.describe Gratitudes do
  it "returns 'Be grateful for: milk, sugar" do
    gratitude = Gratitudes.new
    gratitude.add("milk")
    gratitude.add("sugar")
    result = gratitude.format
    expect(result).to eq "Be grateful for: milk, sugar"
  end
  it "returns 'Be grateful for: '" do
    gratitude = Gratitudes.new
    result = gratitude.format
    expect(result).to eq "Be grateful for: "
  end
end