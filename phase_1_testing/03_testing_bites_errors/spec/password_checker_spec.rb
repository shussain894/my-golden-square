require 'password_checker'

RSpec.describe PasswordChecker do
  it "returns 'true'" do
    password = PasswordChecker.new
    expect(password.check("astronaut")).to eq true
  end
  context "invalid when < 8 characters" do
    it "fails" do
      password = PasswordChecker.new
      expect { password.check("abc")}.to raise_error "Invalid password, must be 8+ characters."
    end
  end  
end