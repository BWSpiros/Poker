require './player'


class Game
  attr_reader  :players
  attr_accessor :pot, :in_hand_players, :deck

  def initialize(num_players = 3)
    @players = Array.new(num_players) { Player.new([], (50..100).to_a.sample) }
    @deck = Deck.new
    @deck.shuffle
    @pot = 0
    @in_hand_players = @players.clone
  end

  def deal_hand
    in_hand_players.each {|player|
      player.hand = @deck.take(5)
    }
  end

  def betting_round
    call = 0
    in_hand_players[-1].endpoint == true
    in_hand_players.each_with_index do |player, index|
      display_game
      choice = player.play_turn(call)
      case choice

      when Fixnum
        call += choice
        self.pot += call
        player.money -= choice
        players.each {|p| p.endpoint = false}
        players[index-1].endpoint = true

      when "call"
        player.money -= call
        self.pot += call

      when "check"
        next

      when 'fold'
        player.cards = []
        in_hand_players.delete(player)
      end
      return if player.endpoint == true
    end
  end

  def discard_round
    in_hand_players.each do |player|
      choice = player.discard
      player.hand += deck.take(choice)
    end
  end

  def display_game
    puts "\n\n\nPot is #{pot}"
  end


  def give_new_cards(player)
    player.hand << deck.take until player.hand.length == 4
  end

  def game_round
    in_hand_players = players.clone
    self.pot = 0
    deal_hand
    betting_round
    discard_round
    betting_round
    end_hand
  end

end

g = Game.new
g.game_round
#  p g.deal_hand
#
#  p g.players[0].hand.object_id
#   p g.players[1].hand.object_id
#   g.players.each{|x| puts x.hand.object_id}
# # g.game_round