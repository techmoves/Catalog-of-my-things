require_relative 'author'
require_relative 'item'

describe Author do
  author = Author.new('Abdelaziz', 'Soliman')
  describe '#initialize' do
    it 'should create a new Author' do
      expect(author).to be_a Author
    end

    it 'the new Author\'s first name should be Rames' do
      expect(author.first_name).to eq('Abdelaziz')
    end

    it 'the new Author\'s last name should be Jaynor' do
      expect(author.last_name).to eq('Soliman')
    end
  end

  describe '#add_item' do
    it 'should add an item to the items array' do
      item = Item.new(Time.new(2023, 8, 18), true)

      author.add_item(item)

      expect(author.items.length).to eq(1)
    end
  end
end