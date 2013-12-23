require 'test_helper'
class GameTest < ActiveSupport::TestCase

  test "Can create a new game" do
    game = Game.new
    assert !game.deck.nil?
    assert !game.hands.any?.nil?
  end

  test "Can start a game" do
    game = Game.new
    game.start
    assert game.hands.each {|hand| hand.hand_is_full?}
  end

end