require 'test_helper'
class DeckTest < ActiveSupport::TestCase
  test "Can create a new deck" do
    deck = Deck.new
    assert deck.cards.length == 52, "Incorrect deck size"
  end

  test "Can deal a card" do
    deck = Deck.new
    hand = Hand.new
    deck.deal_to hand
    assert deck.cards.length == 51, "Incorrect number of cards remain"
    assert hand.cards.length == 1
  end
end