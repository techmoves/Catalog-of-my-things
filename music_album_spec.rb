require_relative 'music_album'

RSpec.describe MusicAlbum do
  let(:published_date) { Time.new(2000, 1, 1) }
  let(:artist) { 'Test Artist' }
  let(:music_album) { MusicAlbum.new('Test Album', published_date, artist) }

  describe '#initialize' do
    it 'sets artist and tracks' do
      expect(music_album.artist).to eq(artist)
      expect(music_album.tracks).to eq([])
      expect(music_album.on_spotify).to be_falsey
    end
  end

  describe '#to_hash' do
    it 'returns a hash with specific attributes' do
      hash = music_album.to_hash
      expect(hash['type']).to eq('MusicAlbum')
      expect(hash['title']).to eq('Test Album')
      expect(hash['published_date']).to eq(published_date.to_s)
      expect(hash['artist']).to eq(artist)
    end
  end

  describe '.from_hash' do
    it 'creates a MusicAlbum instance from a hash' do
      album_data = {
        'type' => 'MusicAlbum',
        'title' => 'Test Album',
        'published_date' => published_date.to_s,
        'artist' => artist
      }
      music_album = MusicAlbum.from_hash(album_data)
      expect(music_album.title).to eq('Test Album')
      expect(music_album.published_date).to eq(published_date)
      expect(music_album.artist).to eq(artist)
    end
  end

  describe '#add_track' do
    it 'adds a track to the tracks list' do
      music_album.add_track('Track 1')
      expect(music_album.tracks).to eq(['Track 1'])
    end
  end

  describe '#can_be_archived?' do
    it 'returns false if not on Spotify' do
      expect(music_album.can_be_archived?).to be_falsey
    end

    it 'returns true if on Spotify and parent can be archived' do
      music_album.on_spotify = true
      expect(music_album.can_be_archived?).to be_truthy
    end
  end
end
