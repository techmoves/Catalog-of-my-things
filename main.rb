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
require_relative 'methods'
require_relative 'main_menu'

class ConsoleApp
  def initialize
    @items = load_music_albums_from_json || []
    @genres = load_genres_from_json || []
    @game_list = GameList.new
    @author_list = AuthorList.new
    @game_list.obtain_games
    @author_list.obtain_authors
    @book_list = ListBooks.new
    @book_list.load_books
    @label_list = ListLabel.new
    @label_list.load_labels
    main_menu
  end

  def save_data
    @game_list.save_games
    @author_list.save_authors
    @book_list.save_books
    @label_list.save_labels
  end

  def main_menu
    main
  end

  private

  def display_menu_options
    puts 'Select an option:'
    puts '1. List All Books'
    puts '2. list_music_album'
    puts '3. List All Games'
    puts '4. list_all_genres'
    puts '5. List All Labels'
    puts '6. List All Authors'
    puts '7. Add a Book'
    puts '8. Add_music_album'
    puts '9. Add a Game'
    puts '10. Add Genre'
    puts '11. Add Label to Item'
    puts '12. Add Author to Item'
    puts '0. Quit'
  end
end
ConsoleApp.new
