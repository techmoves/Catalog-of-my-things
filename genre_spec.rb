# spec/genre_spec.rb
require_relative 'genre' # Adjust the path as needed
require_relative 'item'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new genre with name and description' do
      name = 'Rock'
      description = 'Genre focused on guitar-driven music'

      genre = Genre.new(name, description)

      expect(genre.name).to eq(name)
      expect(genre.description).to eq(description)
    end
  end

  # You can add more tests as needed
end
