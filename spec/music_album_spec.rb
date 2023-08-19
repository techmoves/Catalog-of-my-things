require_relative '../music_album'

RSpec.describe MusicAlbum do
  describe '.from_hash' do
    context 'with valid hash' do
      it 'creates a MusicAlbum object' do
        hash = {
          'title' => 'Album Title',
          'artist' => 'Artist Name',
          'published_date' => '2023-08-17'
        }
        music_album = MusicAlbum.from_hash(hash)
        expect(music_album).to be_an_instance_of(MusicAlbum)
      end
    end
  end

  describe '.valid_date_components?' do
    context 'with valid date components' do
      it 'returns true' do
        expect(MusicAlbum.valid_date_components?(2023, 8, 17)).to be true
      end
    end

    context 'with invalid date components' do
      it 'returns false' do
        expect(MusicAlbum.valid_date_components?(2023, 15, 32)).to be false
      end
    end
  end
end
