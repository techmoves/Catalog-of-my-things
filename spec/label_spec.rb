require_relative '../label'
require_relative '../item'

RSpec.describe Label do
  describe '#add_item' do
    it "adds the item to the label's items collection" do
      label = Label.new('Test Label')
      item = Item.new('Test Item', Time.new(2022, 1, 1))
      label.add_item(item)

      expect(label.items).to include(item)
    end

    it 'sets the label for the item' do
      label = Label.new('Test Label')
      item = Item.new('Test Item', Time.new(2022, 1, 1))
      label.add_item(item)

      expect(item.label).to eq(label)
    end
  end
end
