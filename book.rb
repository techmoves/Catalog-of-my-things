require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :author, :publish_date, :title

  def initialize(title, author, publish_date, cover_state, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @title = title
    @author = author
    @cover_state = cover_state
  end

  def to_hash
    {
      'title' => @title,
      'author' => @author,
      'published_date' => @published_date,
      'cover_state' => @cover_state
    }
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def add_label(_label)
    @label = label
  end
end
