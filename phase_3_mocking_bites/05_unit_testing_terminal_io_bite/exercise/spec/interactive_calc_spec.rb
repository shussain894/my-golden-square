require 'interactive_calc'

RSpec.describe InteractiveCalculator do
  it "subtracts 2 numbers" do
    terminal = double :terminal

    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("5").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("2").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("5 - 2 = 3").ordered
    
    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run
  end
end 

