class Genre
  attr_reader :name, :description, :items

  def initialize(name, description)
    @name = name
    @description = description
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self # Set the genre property of the item
  end

  def to_hash
    {
      'name' => @name,
      'description' => @description,
      'items' => @items.map(&:to_hash) # Convert items to hashes
    }
  end

  def self.from_hash(hash)
    genre = Genre.new(hash['name'], hash['description'])
    hash['items'].each do |item_data|
      # Assuming you have a way to create items from item_data
      item = create_item_from_data(item_data)
      genre.add_item(item)
    end
    genre
  end
end
