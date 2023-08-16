class Genre
  attr_reader :name, :description, :items

  def initialize(name, description)
    @name = name
    @description = description
    @items = []
  end

  def to_hash
    {
      'name' => @name,
      'description' => @description,
      'items' => @items.map(&:to_hash)
    }
  end

  def add_item(item)
    @items << item
    item.genre = self # Set the genre property of the item
  end
end
