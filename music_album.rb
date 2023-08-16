require_relative 'item'

class MusicAlbum < Item
  attr_accessor :artist, :tracks, :on_spotify

  def initialize(title, published_date, artist)
    super(title, published_date)
    @artist = artist
    @tracks = []
    @on_spotify = false
  end

  def to_hash
    {
      'type' => 'MusicAlbum',
      'title' => @title,
      'published_date' => @published_date.to_s, # Convert the time to string
      'artist' => @artist
      # ... include other attributes specific to MusicAlbum ...
    }
  end

  def self.from_hash(hash)
    title = hash['title']
    published_date_str = hash['published_date']
    published_date = parse_published_date(published_date_str)
    artist = hash['artist']
    # ... initialize other attributes based on hash ...

    MusicAlbum.new(title, published_date, artist)
  end

  def self.parse_published_date(published_date_str)
    date_parts = published_date_str.split
    date = date_parts[0]
    time = date_parts[1]
    year, month, day = date.split('-')
    hour, minute, second = time.split(':')

    Time.new(year.to_i, month.to_i, day.to_i, hour.to_i, minute.to_i, second.to_i)
  end

  def add_track(track)
    @tracks << track
  end

  def can_be_archived?
    parent_result = super
    parent_result && @on_spotify
  end
end
