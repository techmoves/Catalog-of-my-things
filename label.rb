class Label
  attr_accessor :color, :title

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  attr_reader :items

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
