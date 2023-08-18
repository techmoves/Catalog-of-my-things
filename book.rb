require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :author, :labels, :published_year

  def initialize(can_be_archived, published_year, cover_state)
    super(can_be_archived, published_year)
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def add_label(_label)
    @label = label
  end
end
