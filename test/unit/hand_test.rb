require 'test_helper'
class HandTest < ActiveSupport::TestCase

  test "Can add a card to players hand" do
    hand = Hand.new
    hand.draw Card.new(:ace, :spade)
    assert hand.cards.first.value == :ace
  end

  test "Can rank royal flush" do
    hand = Hand.new
    hand.draw Card.new(:ten, :spade)
    hand.draw Card.new(:jack, :spade)
    hand.draw Card.new(:king, :spade)
    hand.draw Card.new(:queen, :spade)
    hand.draw Card.new(:ace, :spade)
    assert hand.rank == :royal_flush, "Incorrect rank given"
  end

  test "Can rank a single pair" do
    hand = Hand.new
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:three, :spade)
    hand.draw Card.new(:four, :spade)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:six, :spade)
    assert hand.rank == :one_pair, "Incorrect rank given"
  end

  test "Can rank two pair" do
    hand = Hand.new
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:three, :spade)
    hand.draw Card.new(:three, :diamond)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:six, :spade)
    assert hand.rank == :two_pair, "Incorrect rank given"
  end

  test "Can get highest pair value" do
    hand = Hand.new
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:queen, :spade)
    hand.draw Card.new(:queen, :diamond)
    hand.draw Card.new(:six, :club)
    hand.draw Card.new(:six, :spade)
    assert hand.highest_pair_value == 12, "Incorrect value given"
  end

  test "Can rank a three of a kind" do
    hand = Hand.new
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:two, :heart)
    hand.draw Card.new(:four, :spade)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:six, :spade)
    assert hand.rank == :three_of_a_kind, "Incorrect rank given"
  end

  test "Can rank a straight" do
    hand = Hand.new
    hand.draw Card.new(:five, :spade)
    hand.draw Card.new(:three, :heart)
    hand.draw Card.new(:four, :spade)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:six, :spade)
    assert hand.rank == :straight, "Incorrect rank given"
  end

  test "Can rank a straight using a low value ace" do
    #a.k.a a sucker straight
    hand = Hand.new
    hand.draw Card.new(:five, :spade)
    hand.draw Card.new(:three, :heart)
    hand.draw Card.new(:four, :spade)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:ace, :spade)
    assert hand.rank == :straight, "Incorrect rank given"
  end

  test "Can rank a flush" do
    hand = Hand.new
    hand.draw Card.new(:ten, :spade)
    hand.draw Card.new(:five, :spade)
    hand.draw Card.new(:king, :spade)
    hand.draw Card.new(:nine, :spade)
    hand.draw Card.new(:ace, :spade)
    assert hand.rank == :flush, "Incorrect rank given"
  end

  test "Can rank a full house" do
    hand = Hand.new
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:two, :heart)
    hand.draw Card.new(:six, :heart)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:six, :spade)
    assert hand.rank == :three_of_a_kind, "Incorrect rank given"
  end

  test "Can rank a four of a kind" do
    hand = Hand.new
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:two, :heart)
    hand.draw Card.new(:four, :spade)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:two, :diamond)
    assert hand.rank == :four_of_a_kind, "Incorrect rank given"
  end

  test "Can rank a straight flush" do
    hand = Hand.new
    hand.draw Card.new(:five, :spade)
    hand.draw Card.new(:three, :spade)
    hand.draw Card.new(:four, :spade)
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:six, :spade)
    assert hand.rank == :straight_flush, "Incorrect rank given"
  end

  test "Can get high card" do
    hand = Hand.new
    hand.draw Card.new(:two, :spade)
    hand.draw Card.new(:three, :spade)
    hand.draw Card.new(:three, :diamond)
    hand.draw Card.new(:two, :club)
    hand.draw Card.new(:ace, :spade)
    assert hand.high_card.to_s == "Ace of Spades"
  end

end