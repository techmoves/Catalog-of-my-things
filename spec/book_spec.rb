require_relative '../item'
require_relative '../book'
require_relative '../years_difference'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, archived, publisher, cover_state, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super == true || @cover_state == 'bad'

    false
  end
end

describe Book do
  it 'can be archived if it is 10 years old or older' do
    book = Book.new(Time.now - 11, true, 'Harper Collins', 'good')
    expect(book.can_be_archived?).to be false
  end

  it 'cannot be archived if it is less than 10 years old' do
    book = Book.new(Time.now - 9, false, 'Harper Collins', 'good')
    expect(book.can_be_archived?).to be false
  end

  it 'can be archived if the cover is in bad condition' do
    book = Book.new(Time.now - 5, false, 'Harper Collins', 'bad')
    expect(book.can_be_archived?).to be true
  end
end
