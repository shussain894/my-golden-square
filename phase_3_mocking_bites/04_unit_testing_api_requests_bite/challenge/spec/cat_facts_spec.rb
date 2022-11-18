require 'cat_facts'

RSpec.describe CatFacts do
  it "returns a fact about cats" do
    fact_dbl = double :response
    allow(fact_dbl).to receive(:get)
    .with(URI("https://catfact.ninja/fact"))
    .and_return('{"fact":"Tylenol and chocolate are both poisionous to cats.","length":50}')

    cat_facts = CatFacts.new(fact_dbl)

    expect(cat_facts.provide).to eq "Cat fact: Tylenol and chocolate are both poisionous to cats."
  end
end 
