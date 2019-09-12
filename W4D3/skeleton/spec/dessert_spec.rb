require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:pie) { Dessert.new("pie", 6, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do

    it "sets a type" do 
      expect(pie.type).to eq("pie") 
    end

    it "sets a quantity" do 
      expect(pie.quantity).to eq(6)
    end

    it "starts ingredients as an empty array" do 
      expect(pie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("pie", "a lot", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(pie.ingredients).to be_empty
      pie.add_ingredient("apple")
      expect(pie.ingredients).to eq(["apple"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      pie.add_ingredient("butter")
      pie.add_ingredient("sugar")
      pie.add_ingredient("flour")
      before = pie.ingredients.dup
      pie.mix!

      expect(pie.ingredients).to_not eq(before)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      pie.eat(3)
      expect(pie.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { pie.eat(300) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize) { 'Chef' }
      expect(pie.serve).to include('Chef')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      allow(chef).to receive(:bake) { pie }
      expect {pie.make_more}.to_not raise_error
    end
  end
end
