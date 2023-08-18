require 'json'
require_relative 'item'
require_relative 'book'
require_relative 'book_list'
require_relative 'label'
require_relative 'label_list'
require_relative 'game_list'
require_relative 'game'
require_relative 'author_list'
require_relative 'author'
require_relative 'genre'
require_relative 'music_album'
# rubocop:disable Metrics/ClassLength
class ConsoleApp
  def initialize
    @items = load_music_albums_from_json || []
    @genres = load_genres_from_json || []
    @game_list = GameList.new
    @author_list = AuthorList.new
    @game_list.obtain_games # Load game data from JSON file # Instantiate GameList class
    @author_list.obtain_authors
    @book_list = ListBooks.new
    @book_list.load_books
    @label_list = ListLabel.new
    @label_list.load_labels
    main_menu
  end

  # rubocop:enable Metrics/ClassLength
  def save_data
    @game_list.save_games
    @author_list.save_authors
    @book_list.save_books
    @label_list.save_labels
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
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
        @label_list.add_label_menu
      when 6
        @author_list.add_author_menu
      when 7
        @book_list.list_all_books
      when 8
        @label_list.list_all_labels
      when 9
        @book_list.add_book
      when 10
        @game_list.list_all_games
      when 11
        @author_list.list_all_authors
      when 12
        @game_list.add_game_menu
      when 13
        save_genres_to_json # Save genres to JSON file
        list_all_genres
      when 14
        add_music_album
      when 15
        @items = load_music_albums_from_json
        list_all_music_albums
      when 0
        puts 'Goodbye!'
        save_data
        break
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
    # rubocop:enable Metrics/BlockLength
    # rubocop:enable Metrics/MethodLength
  end
  # rubocop:enable Metrics/CyclomaticComplexity

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
    puts '10. List All Games'
    puts '11. List All Authors'
    puts '12. Add a Game'
    puts '13  list_all_genres'
    puts '14  Add_music_album'
    puts '15  list_music_album'
    puts '0. Quit'
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
    save_music_albums_to_json # Save the updated collection
    puts 'Music album added.'
  end

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

  def save_music_albums_to_json
    music_albums = @items.select { |item| item.is_a?(MusicAlbum) }
    File.open('music_albums.json', 'w') do |file|
      json_data = music_albums.map(&:to_hash)
      file.write(JSON.pretty_generate(json_data))
    end
  end

  def save_genres_to_json
    File.open('genres.json', 'w') do |file|
      json_data = @genres.map(&:to_hash)
      file.write(JSON.pretty_generate(json_data))
    end
  end

  def load_genres_from_json
    genres_file_path = 'genres.json'
    return unless File.exist?(genres_file_path)

    json_data = JSON.parse(File.read(genres_file_path))
    json_data.map { |genre_data| Genre.from_hash(genre_data) }
  end

  def load_music_albums_from_json
    music_albums_file_path = 'music_albums.json'
    return [] unless File.exist?(music_albums_file_path)

    json_data = JSON.parse(File.read(music_albums_file_path))
    json_data.map { |album_data| MusicAlbum.from_hash(album_data) }
  end
end
ConsoleApp.new
