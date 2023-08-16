require_relative './item'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name, id = Time.now.to_f.to_s)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    if item.is_a?(Item) && !@items.include?(item)
      @items << item
      item.author = self
    end
  end
end