require 'test_helper'

class GameScorerTest < ActiveSupport::TestCase
  test "Can find winning hand" do
    royal_flush = Hand.new
    royal_flush.draw Card.new(:ten, :spade)
    royal_flush.draw Card.new(:jack, :spade)
    royal_flush.draw Card.new(:king, :spade)
    royal_flush.draw Card.new(:queen, :spade)
    royal_flush.draw Card.new(:ace, :spade)

    two_pair = Hand.new
    two_pair.draw Card.new(:two, :spade)
    two_pair.draw Card.new(:three, :spade)
    two_pair.draw Card.new(:three, :diamond)
    two_pair.draw Card.new(:two, :club)
    two_pair.draw Card.new(:six, :spade)

    high_card = Hand.new
    high_card.draw Card.new(:jack, :spade)
    high_card.draw Card.new(:three, :spade)
    high_card.draw Card.new(:four, :diamond)
    high_card.draw Card.new(:two, :club)
    high_card.draw Card.new(:ace, :spade)

    four_of_a_kind = Hand.new
    four_of_a_kind.draw Card.new(:two, :spade)
    four_of_a_kind.draw Card.new(:two, :heart)
    four_of_a_kind.draw Card.new(:four, :spade)
    four_of_a_kind.draw Card.new(:two, :club)
    four_of_a_kind.draw Card.new(:two, :diamond)

    scorer_a = GameScorer.new([royal_flush, two_pair, high_card, four_of_a_kind])
    scorer_b = GameScorer.new([two_pair, high_card, royal_flush, four_of_a_kind])

    assert scorer_a.winning_hand == royal_flush
    assert scorer_b.winning_hand == royal_flush
  end

#Poker rules: If a winning hand cannot be determined by it's rank, then the winner is chosen by high card
  test "Can find winning hand by high card" do
    ace_high = Hand.new
    ace_high.draw Card.new(:two, :spade)
    ace_high.draw Card.new(:jack, :spade)
    ace_high.draw Card.new(:three, :diamond)
    ace_high.draw Card.new(:six, :club)
    ace_high.draw Card.new(:ace, :spade)

    jack_high = Hand.new
    jack_high.draw Card.new(:two, :spade)
    jack_high.draw Card.new(:jack, :spade)
    jack_high.draw Card.new(:three, :diamond)
    jack_high.draw Card.new(:six, :club)
    jack_high.draw Card.new(:nine, :spade)

    ten_high = Hand.new
    ten_high.draw Card.new(:two, :spade)
    ten_high.draw Card.new(:ten, :spade)
    ten_high.draw Card.new(:three, :diamond)
    ten_high.draw Card.new(:six, :club)
    ten_high.draw Card.new(:nine, :spade)

    king_high = Hand.new
    king_high.draw Card.new(:two, :spade)
    king_high.draw Card.new(:king, :spade)
    king_high.draw Card.new(:three, :diamond)
    king_high.draw Card.new(:six, :club)
    king_high.draw Card.new(:nine, :spade)

    scorer_a = GameScorer.new([ace_high, king_high, ten_high, jack_high])
    scorer_b = GameScorer.new([king_high, ace_high, ten_high, jack_high])

    assert scorer_a.winning_hand == ace_high, "Incorrect winner chosen"
    assert scorer_b.winning_hand == ace_high, "Incorrect winner chosen"
  end

  test "Straight should beat a sucker straight" do
    sucker_straight = Hand.new
    sucker_straight.draw Card.new(:five, :spade)
    sucker_straight.draw Card.new(:three, :heart)
    sucker_straight.draw Card.new(:four, :spade)
    sucker_straight.draw Card.new(:two, :club)
    sucker_straight.draw Card.new(:ace, :spade)

    straight = Hand.new
    straight.draw Card.new(:five, :spade)
    straight.draw Card.new(:three, :heart)
    straight.draw Card.new(:four, :spade)
    straight.draw Card.new(:two, :club)
    straight.draw Card.new(:six, :spade)

    scorer_a = GameScorer.new([sucker_straight, straight])
    scorer_b = GameScorer.new([straight,sucker_straight])

    assert scorer_a.winning_hand == straight, "Incorrect winner chosen"
    assert scorer_b.winning_hand == straight, "Incorrect winner chosen"
    assert sucker_straight.high_card.value == :five, "Incorrect high card: #{sucker_straight.high_card}"
  end

  test "Can score a game" do
    game = Game.new
    game.start
    scorer = GameScorer.new(game)
    assert !scorer.winning_hand.nil?
  end
end