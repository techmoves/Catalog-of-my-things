def main
  puts 'Welcome to the catalog of my Things!'
  loop do
    display_menu_options
    choice = gets.chomp.to_i
    case choice
    when 1
      @book_list.list_all_books
    when 2
      @items = load_music_albums_from_json
      list_all_music_albums
    when 3
      @game_list.list_all_games
    when 4
      list_all_genres
    when 5
      @label_list.list_all_labels
    when 6
      @author_list.list_all_authors
    when 7
      @book_list.add_book
    when 8
      add_music_album
    when 9
      @game_list.add_game_menu
    when 10
      add_genre
      save_genres_to_json
    when 11
      @label_list.add_label_menu
    when 12
      @author_list.add_author_menu
    when 0
      puts 'Goodbye!'
      save_data
      break
    else
      puts 'Invalid choice. Please select a valid option.'
    end
  end
end
