require 'test_helper'

class CardTest < ActiveSupport::TestCase
  test "can create a new card" do
    card = Card.new(:ace, :spade)
    assert card.value == :ace
    assert card.suit == :spade
  end
  test "to_s writes english face value ex: Ace of Spades" do
    card = Card.new(:ace, :spade)
    assert card.to_s == "Ace of Spades"
  end

end
