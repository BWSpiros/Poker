require './deck'


class Hand
  attr_reader :hand
  def initialize(cards)
    @hand = cards
  end

  def flush?
    hand.all? {|card| card.suit == hand[0].suit}
  end

  def straight?
    hand_values = []
    hand.each do |card|
      hand_values << card.poker_values
      hand_values << 14 if card.poker_values == 1
    end

    hand_values.sorted!

    if

    4.times do |t|
      return false if hand_values[t]+1 != hand_values[t+1]
    end
    true

    hand_values.sorted.each_with_index do |card, index|
      return true if hand_values.sorted[index+1] == nil


    hand_values.sorted.all?
  end


end

deck = Deck.new
hand = deck.shuffle.take(5)
p hand
hand.each { |card| p card.poker_values}