class Card
  @@suits = [:club, :spade, :diamond, :heart]
  @@values = {
      :two => 2,
      :three => 3,
      :four => 4,
      :five => 5,
      :six => 6,
      :seven => 7,
      :eight => 8,
      :nine => 9,
      :ten => 10,
      :jack => 11,
      :queen => 12,
      :king => 13,
      :ace => 14
  }
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
  def value
    @value
  end
  def suit
    @suit
  end
  def numeric_value
    @@values[@value]
  end
  def to_s
    @value.to_s.capitalize << " of " << @suit.to_s.capitalize.pluralize
  end
  private

end