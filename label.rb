class Label < Item
  attr_accessor :name, :items

  def initialize(name)
    super()
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end
end

