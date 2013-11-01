require './hand'

class Player
  attr_accessor :hand, :money, :endpoint
  def initialize (hand = [], money = 0)
    @hand = hand
    @money = money
    @endpoint = false
  end

  def play_turn(call)
    puts display_hand
    if call == 0
      "\n\n\n"
      puts "Check, bet, or fold?"
      puts "i.e. check, bet 100, or fold"
      puts "\n\n\n"
    else
      puts "\n\n\nThe bet is #{call}. Call, raise, or fold?"
    end
    user_choice = gets.chomp
    if ((user_choice == "bet") || (user_choice == "raise"))
      puts "How much?"
      user_choice = gets.chomp.to_i
      #play_turn(call) unless valid_bet?
    end
    return user_choice
  end

  def discard
    puts "\n\n\n"
    puts "Your current hand"
    puts display_hand
    puts "0  1  2  3  4"
    puts "Enter the cards you want to discard"
    puts "i.e. '1,3,4'"
    discards = gets.chomp.split(',')
    puts "\n\n\n"
    discards.sort.reverse.each {|c| hand.delete_at(c.to_i)}
    return discards.length
  end

  def display_hand
    # cards = ""
    # hand.each{|x| cards + x.to_s+' '}
    # cards
    hand.join(" ")
  end


  def valid_bet?
    true
  end
end