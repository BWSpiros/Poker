require 'rspec'
require './game'


describe Game do
  subject(:game) { Game.new }

  describe "#initialize" do

    it "should create full deck" do
      expect(game.deck.count).to eq(52)
    end

    it "should create the right amount of players" do
      expect(game.players.length).to eq(3)
    end

    it "should have an empty pot" do
      expect(game.pot).to eq(0)
    end

    it "should be player 0's turn" do
      expect(player_turn).to eq(0)
    end

  end

  describe "#deal_cards" do
    it "should give each player 5 cards" do
      expect{ game.players.all?{ |player| player.hand.count == 5} }.to be true
    end
    if "should remove the right # of cards from deck" do
      expect(game.deck.count).to eq(52-(game.players.length * 5))
    end

  end

  describe "#pot" do
    it "should accept money"
  end

end