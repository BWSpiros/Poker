require 'rspec'
require './player'


describe Player do
  subject(:player) { Player.new([],100) }

  describe "#initialize" do
    it "should have an empty hand array and 100 dollars" do
      expect(player.hand).to eq([])
      expect(player.money).to eq(100)
    end
  end

end