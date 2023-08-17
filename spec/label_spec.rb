require_relative '../label'  # Adjust the path as needed

RSpec.describe Label do
  let(:label_color) { "red" }
  let(:label_title) { "Sample Label" }
  
  describe "#add_item" do
    it "adds an item to the label's items array" do
      label = Label.new(label_color, label_title)
      item = double("Item")
      label.add_item(item)
      expect(label.items).to include(item)
    end
  end
end
