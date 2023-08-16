require_relative '../item'
# require 'rspec'

describe Item do
  let(:item) { Item.new('Test Item', Time.new(2000)) }

  describe '#can_be_archived?' do
    context 'when published more than 10 years ago' do
      it 'returns true' do
        expect(item.can_be_archived?).to be true
      end
    end

    context 'when published less than 10 years ago' do
      it 'returns false' do
        allow(Time).to receive(:now).and_return(Time.new(2010, 1, 1))
        expect(item.can_be_archived?).to be false
      end
    end
  end
end
