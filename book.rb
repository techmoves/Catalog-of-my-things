class Book < Item
  attr_accessor :cover_state, :author, :labels

  def initialize(title, author, published_date, cover_state)
    super(title, published_date)
    @cover_state = cover_state
    @author = author
    @labels = []
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
