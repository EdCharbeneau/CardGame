class Card

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
  def to_s
    @value.to_s.capitalize << " of " << @suit.to_s.capitalize.pluralize
  end
end