require 'present'

# RSpec.describe Present do
#   context "when contents have already been wrapped" do
#     it "fails" do
#       present = Present.new
#       present.wrap("rocket")
#       result = present.wrap("astronaut")
#       expect { result }.to raise_error "A contents has already been wrapped."
#     end
#   end
# end

RSpec.describe Present do
  context "when contents have already been wrapped" do
    it "fails" do
      present = Present.new
      present.wrap("rocket")
      expect { present.wrap("astronaut") }.to raise_error "A contents has already been wrapped."
    end
  end
  context "when no contents have been wrapped" do
    it "fails" do
      present = Present.new
      expect { present.unwrap }.to raise_error "No contents have been wrapped."
    end
  end
    it "unwraps present" do
      present = Present.new
      present.wrap("rocket")
      expect(present.unwrap).to eq "rocket"
    end 
end