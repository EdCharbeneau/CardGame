class GameScorer
  attr_reader :winning_hand

  @@hand_rankings = {
      :royal_flush => 10,
      :straight_flush => 9,
      :four_of_a_kind => 8,
      :full_house => 7,
      :flush => 6,
      :straight => 5,
      :three_of_a_kind => 4,
      :two_pair => 3,
      :one_pair => 2,
      :high_card => 1
  }

  def initialize(game_or_hands)
    raise "Unsupported game type" unless game_or_hands.kind_of?(Game) || game_or_hands.all? { |type| type.kind_of?(Hand) }
    @hands = game_or_hands.kind_of?(Game) ? game_or_hands.hands : game_or_hands
    get_winning_hand
  end

  private
  def winning_hand_sort
    #sort by rank, else defer to the high card
    lambda do |a, b|
      hand_order = @@hand_rankings[a.rank] <=> @@hand_rankings[b.rank]
      hand_order != 0 ? hand_order : a.high_card.numeric_value <=> b.high_card.numeric_value
    end
  end

  def ranked_hands
    @hands.sort(&winning_hand_sort)
  end

  def get_winning_hand
    @winning_hand = ranked_hands.last
  end

end