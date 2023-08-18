# spec/label_spec.rb
require_relative '../label'  # Adjust the path as needed

RSpec.describe Label do
  let(:label_title) { 'Test Label' }
  let(:label_color) { 'Blue' }
  let(:label) { Label.new(label_title, label_color) }

  describe '#initialize' do
    it 'sets title and color attributes' do
      expect(label.title).to eq(label_title)
      expect(label.color).to eq(label_color)
    end

    it 'generates an id if not provided' do
      expect(label.instance_variable_get(:@id)).not_to be_nil
    end
  end

end
