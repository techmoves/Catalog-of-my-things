require_relative 'book'

RSpec.describe Book do
  let(:published_date) { Time.new(2020, 1, 1) }

  describe '#can_be_archived?' do
    context "with cover state 'good'" do
      it 'returns true if published over 10 years ago' do
        book = Book.new('Sample Book', published_date, 'good')
        expect(book.can_be_archived?).to be true
      end

      it 'returns false if published within 10 years' do
        recent_date = Time.now
        book = Book.new('Recent Book', recent_date, 'good')
        expect(book.can_be_archived?).to be false
      end
    end

    context "with cover state 'bad'" do
      it 'returns true regardless of published date' do
        book = Book.new('Worn Book', published_date, 'bad')
        expect(book.can_be_archived?).to be true
      end
    end
  end
end
