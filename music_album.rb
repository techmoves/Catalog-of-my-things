require_relative 'item'

class MusicAlbum < Item
  attr_accessor :artist, :tracks, :on_spotify

  def initialize(title, published_date, artist)
    super(title, published_date)
    @artist = artist
    @published_date = published_date
    @title = title
    @tracks = []
    @on_spotify = false
  end

  def to_hash
    {
      'type' => 'MusicAlbum',
      'title' => @title,
      'published_date' => @published_date&.to_s, # Convert to string if not nil
      'artist' => @artist
    }
  end

  def self.from_hash(hash)
    title = hash['title']
    artist = hash['artist']
    published_date = parse_published_date(hash['published_date'])
    MusicAlbum.new(title, published_date, artist)
  end

  def self.parse_published_date(date_str)
    return nil if date_str.nil?

    year, month, day = date_str.split('-').map(&:to_i)
    if valid_date_components?(year, month, day)
      Time.new(year, month, day)
    else
      puts "Invalid date components: Year: #{year}, Month: #{month}, Day: #{day}"
      nil
    end
  end

  def self.valid_date_components?(year, month, day)
    year.between?(1000, 9999) && month.between?(1, 12) && day.between?(1, 31)
  end

  def add_track(track)
    @tracks << track
  end

  def can_be_archived?
    parent_result = super
    parent_result && @on_spotify
  end
end
