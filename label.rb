class Book < Item
  attr_accessor :cover_state

  def initialize(title, published_date, cover_state)
    super(title, published_date)
    @cover_state = cover_state
  end

  def add_item(item)
    @items << item
    item.labels << self
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
