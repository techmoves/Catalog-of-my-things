require_relative 'item'

class MusicAlbum < Item
  attr_accessor :artist, :tracks, :on_spotify



  def initialize(title, published_date, artist)
    super(title, published_date)
    @artist = artist
    @tracks = []
    @on_spotify = false
  end

  def add_track(track)
    @tracks << track
  end

  def can_be_archived?
    parent_result = super
    parent_result && @on_spotify
  end
end
