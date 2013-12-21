require 'test_helper'
class HandTest < ActiveSupport::TestCase
  test "Can add a card to players hand" do
    hand = Hand.new
    hand.draw Card.new(:ace, :spade)
    assert hand.cards.first.value == :ace
  end
end