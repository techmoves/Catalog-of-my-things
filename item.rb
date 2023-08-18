require_relative 'years_difference'

class Item
  include YearsDifference
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived, id = Time.now.to_f.to_s)
    @id = id
    @publish_date = publish_date
    @archived = archived
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

  def to_hash
    {
      title: @title,
      published_date: @published_date,
      archived: @archived # Include the 'archived' attribute
    }
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
