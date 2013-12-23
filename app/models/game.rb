class Game
  attr_reader :deck, :hands

  def initialize(number_of_hands = 4)
    @hands = []
    number_of_hands.times {@hands << Hand.new }
    @deck = Deck.new
  end

  def start
    5.times {@hands.each {|hand| @deck.deal_to hand}}
  end

end