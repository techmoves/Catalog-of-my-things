class Item
  attr_reader :title, :published_date
  attr_accessor :archived

  def initialize(title, published_date)
    @title = title
    @published_date = published_date
    @archived = false
    @genres = []
    @sources = []
    @labels = []
  end

  def add_genre(genre)
    @genres << genre
  end

  def add_source(source)
    @sources << source
  end

  def add_label(label)
    @labels << label
  end

  def add_author(author)
    @author << author
  end

  def can_be_archived?
    years_since_publication = Time.now.year - @published_date.year
    years_since_publication >= 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been moved to the archive.'
    else
      puts 'Item cannot be archived yet.'
    end
  end
end
