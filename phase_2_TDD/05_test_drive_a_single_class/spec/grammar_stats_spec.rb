require 'grammar_stats'

RSpec.describe GrammarStats do
  context "returns a boolean if string begins with a capital and ends with a sentence-ending punctuation mark" do
    it "returns false as string is empty" do 
      grammar = GrammarStats.new 
      expect(grammar.check("")).to eq false
    end 

    it "returns false as string does not begin with a capital letter" do 
      grammar = GrammarStats.new 
      expect(grammar.check("sentence")).to eq false
    end 

    it "returns false as string does not end with a !, ., or ?" do 
      grammar = GrammarStats.new 
      expect(grammar.check("Sentence")).to eq false
    end 
  end
  
  it "returns true as string begins with a capital and ends with sentence-ending punctuation mark" do
    grammar = GrammarStats.new
    expect(grammar.check("Sentence!")).to eq true
  end 


  describe "percentage_good" do

    it "returns 0 for one check that fails" do
      grammar = GrammarStats.new
      grammar.check("capital") # this passes in the check so the above 'check' can take place
      result = grammar.percentage_good # this runs the formula in 'percentage_good'
      expect(result).to eq 0 
    end
    it "returns 0 for two checks that fail" do
      grammar = GrammarStats.new
      grammar.check("capital") 
      grammar.check("nonsense!") 
      result = grammar.percentage_good # this runs the formula in 'percentage_good'
      expect(result).to eq 0 
    end 
    it "returns 100 for one check that passes" do
      grammar = GrammarStats.new
      grammar.check("Capital.")
      result = grammar.percentage_good
      expect(result).to eq 100
    end
    it "returns 100 for 2 checks that pass" do
      grammar = GrammarStats.new
      grammar.check("Capital.")
      grammar.check("Horse!")
      result = grammar.percentage_good
      expect(result).to eq 100
    end
    it "returns 50 for 2 checks where one fails and one passes" do
      grammar = GrammarStats.new
      grammar.check("Capital.")
      grammar.check("Horse")
      result = grammar.percentage_good
      expect(result).to eq 50
    end
  end
end 