require 'json'
require_relative 'item'
require_relative 'book'
require_relative 'label'
require_relative 'genre'
require_relative 'music_album'

# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
class ConsoleApp
  DATA_FOLDER = 'data/'.freeze # Define the data folder path

  def initialize
    @items = load_items_from_json || []
    @genres = load_genres_from_json || []
    main_menu
  end

  def main_menu
    puts 'Welcome to the catalog of my Things!'
    # rubocop:disable Metrics/BlockLength
    loop do
      display_menu_options
      choice = gets.chomp.to_i

      case choice
      when 1
        add_item
      when 2
        move_to_archive
      when 3
        add_genre
      when 4
        add_source_to_item
      when 5
        add_label_to_item
      when 6
        add_author_to_item
      when 7
        list_all_books
      when 8
        list_all_labels
      when 9
        add_book
      when 10
        list_all_music_albums
      when 11
        list_all_genres
      when 12
        add_music_album
      when 13
        puts 'Goodbye!'
        break
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
    # rubocop:enable Metrics/BlockLength
  end

  private

  def display_menu_options
    puts 'Select an option:'
    puts '1. Add Item'
    puts '2. Move Item to Archive'
    puts '3. Add Genre'
    puts '4. Add Source to Item'
    puts '5. Add Label to Item'
    puts '6. Add Author to Item'
    puts '7. List All Books'
    puts '8. List All Labels'
    puts '9. Add a Book'
    puts '10. List All Music Albums'
    puts '11. List All Genres'
    puts '12. Add a Music Album'
    puts '13. Quit'
  end

  def add_item
    puts 'Enter item title:'
    title = gets.chomp
    puts 'Enter published year:'
    year = gets.chomp.to_i

    item = Item.new(title, Time.new(year))
    @items << item
    puts 'Item added.'
  end

  def add_genre
    puts 'Enter genre name:'
    name = gets.chomp
    puts 'Enter genre description:'
    description = gets.chomp

    genre = Genre.new(name, description)
    @genres << genre
    puts 'Genre added.'
  end

  def list_all_music_albums
    puts 'Listing all music albums:'
    @items.each do |item|
      puts "Title: #{item.title}, Artist: #{item.artist}" if item.is_a?(MusicAlbum)
    end
  end

  def list_all_genres
    puts 'Listing all genres:'
    @genres.each do |genre|
      puts "Genre: #{genre.name}, Description: #{genre.description}"
    end
  end

  def add_music_album
    puts 'Enter album title:'
    title = gets.chomp
    puts 'Enter published year:'
    year = gets.chomp.to_i
    puts 'Enter artist:'
    artist = gets.chomp

    music_album = MusicAlbum.new(title, Time.new(year), artist)
    @items << music_album
    puts 'Music album added.'
  end

  # Implement the missing methods


  def add_source_to_item
    puts 'Enter the index of the item:'
    index = gets.chomp.to_i
    if index.between?(1, @items.size)
      item = @items[index - 1]
      puts 'Enter source:'
      source = gets.chomp
      item.add_source(source)
      puts 'Source added to the item.'
    else
      puts 'Invalid index. Please select a valid item.'
    end
  end

  def add_label_to_item
    puts 'Enter the index of the item:'
    index = gets.chomp.to_i
    if index.between?(1, @items.size)
      item = @items[index - 1]
      puts 'Enter label:'
      label = gets.chomp
      item.add_label(label)
      puts 'Label added to the item.'
    else
      puts 'Invalid index. Please select a valid item.'
    end
  end

  # def add_author_to_item
  #   # Implement this method
  # end

  def list_all_books
    puts 'Listing all books:'
    @items.each do |item|
      if item.is_a?(Book)
        puts "Title: #{item.title}, Published Year: #{item.published_year}, Cover State: #{item.cover_state}"
      end
    end
  end

  def list_all_labels
    puts 'Listing all labels:'
    # Retrieve and display labels from JSON file
    # You need to implement this based on your data structure
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter published year:'
    year = gets.chomp.to_i
    puts 'Enter cover state (good/bad):'
    cover_state = gets.chomp

    book = Book.new(title, Time.new(year), cover_state)
    @items << book
    puts 'Book added.'
  end

  def save_items_to_json
    File.open('items.json', 'w') do |file|
      json_data = @items.map(&:to_hash)
      file.write(JSON.pretty_generate(json_data))
    end
  end

  def save_genres_to_json
    File.open('genres.json', 'w') do |file|
      json_data = @genres.map(&:to_hash)
      file.write(JSON.pretty_generate(json_data))
    end
  end

  def load_items_from_json
    items_file_path = File.join(DATA_FOLDER, 'items.json')
    return unless File.exist?(items_file_path)

    json_data = JSON.parse(File.read(items_file_path))
    json_data.map do |item_data|
      case item_data['type']
      when 'Book'
        Book.from_hash(item_data)
      when 'MusicAlbum'
        MusicAlbum.from_hash(item_data)
        # Add more cases for other types
      end
    end
  end

  def load_genres_from_json
    genres_file_path = File.join(DATA_FOLDER, 'genres.json')
    return unless File.exist?(genres_file_path)

    json_data = JSON.parse(File.read(genres_file_path))
    json_data.map { |genre_data| Genre.from_hash(genre_data) }
  end

  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/ClassLength
end

ConsoleApp.new
