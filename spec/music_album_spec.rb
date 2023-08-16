require_relative '../music_album'
# require 'rspec'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new('Test Album', Time.new(2000), 'Test Artist') }

  describe '#can_be_archived?' do
    context 'when parent can be archived and on_spotify is true' do
      it 'returns true' do
        music_album.on_spotify = true
        allow(Time).to receive(:now).and_return(Time.new(2012, 1, 1)) # Simulate 12 years after publication
        expect(music_album.can_be_archived?).to be true
      end
    end

    context 'when parent cannot be archived' do
      it 'returns false' do
        music_album.on_spotify = true
        allow(Time).to receive(:now).and_return(Time.new(2010, 1, 1)) # Simulate 10 years after publication
        expect(music_album.can_be_archived?).to be false
      end
    end

    context 'when on_spotify is false' do
      it 'returns false' do
        allow(Time).to receive(:now).and_return(Time.new(2012, 1, 1)) # Simulate 12 years after publication
        expect(music_album.can_be_archived?).to be false
      end
    end
  end
end
