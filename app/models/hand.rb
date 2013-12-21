class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end
  def draw(card)
    #raise 'Maximum hand size reached' if @card.length > 4
    @cards << card
  end

end