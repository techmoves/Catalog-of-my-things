class Label
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end
end

class Item
  attr_accessor :title, :published_date, :labels

  def initialize(title, published_date)
    @title = title
    @published_date = published_date
    @labels = []
  end

  def add_label(label)
    @labels << label
  end
end
