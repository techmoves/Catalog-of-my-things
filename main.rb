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
    save_genres_to_json
    save_music_albums_to_json
  end

  def menu_options
    {
      1 => { text: 'List All Books', action: -> { @book_list.list_all_books } },
      2 => { text: 'List Music Albums', action: -> { list_all_music_albums } },
      3 => { text: 'List All Games', action: -> { @game_list.list_all_games } },
      4 => { text: 'List All Genres', action: -> { list_all_genres } },
      5 => { text: 'List All Labels', action: -> { @label_list.list_all_labels } },
      6 => { text: 'List All Authors', action: -> { @author_list.list_all_authors } },
      7 => { text: 'Add a Book', action: -> { @book_list.add_book } },
      8 => { text: 'Add Music Album', action: -> { add_music_album } },
      9 => { text: 'Add a Game', action: -> { @game_list.add_game_menu } },
      10 => { text: 'Add Genre', action: -> { add_genre } },
      11 => { text: 'Add Label to Item', action: -> { @label_list.add_label_menu } },
      12 => { text: 'Add Author to Item', action: -> { @author_list.add_author_menu } },
      0 => { text: 'Quit', action: lambda {
                                     puts 'Goodbye!'
                                     save_data
                                     exit
                                   } }
    }
  end

  def main_menu
    menu_options

    puts 'Welcome to the catalog of my Things!'
    loop do
      display_menu_options(menu_options)
      choice = gets.chomp.to_i
      menu_item = menu_options[choice]

      if menu_item
        menu_item[:action].call
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
  end

  private

  def display_menu_options(menu_options)
    puts 'Select an option:'
    menu_options.each do |key, value|
      puts "#{key}. #{value[:text]}"
    end
  end

  # ... (your existing methods)
end

ConsoleApp.new.main_menu
