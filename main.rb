require_relative 'item'
require_relative 'book'
require_relative 'label'

class ConsoleApp
  def initialize
    @items = []
    main_menu
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def main_menu
    
    puts 'Welcome to catalog of my Things!'
    loop do
      display_menu_options

      choice = gets.chomp.to_i

      case choice
      when 1
        add_item
      when 2
        move_to_archive
      when 3
        add_genre_to_item_menu
      when 4
        add_source_to_item_menu
      when 5
        add_label_to_item_menu
      when 6
        add_author_to_item_menu
      when 7
        list_all_books
      when 8
        list_all_labels
      when 9
        add_book
      when 10
        puts 'Goodbye!'
        break
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  private

  def display_menu_options
    puts 'Select an option:'
    puts 'Select an option:'
    puts '1. Add Item'
    puts '2. Move Item to Archive'
    puts '3. Add genre'
    puts '4. add_source_to_item_menu'
    puts '5. add_label_to_item_menu'
    puts '6. add_author_to_item_menu'
    puts '7. List all books'
    puts '8. List all labels'
    puts '9. Add a book'
    puts '10. List all Games'
    puts '11. List all Authors'
    puts '12. Add a game'
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

  def add_genre_to_item(item)
    puts 'Enter genre:'
    genre = gets.chomp
    item.add_genre(genre)
    puts 'Genre added to the item.'
  end

  def add_source_to_item(item)
    puts 'Enter source:'
    source = gets.chomp
    item.add_source(source)
    puts 'Source added to the item.'
  end

  def add_label_to_item(item)
    puts 'Enter label:'
    label = gets.chomp
    item.add_label(label)
    puts 'Label added to the item.'
  end

  def list_all_books
    puts 'Listing all books:'
    # Retrieve and display books from JSON file
  end

  def list_all_labels
    puts 'Listing all labels:'
    # Retrieve and display labels from JSON file
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

  def move_to_archive
    if @items.empty?
      puts 'No items to move.'
    else
      puts 'Select an item to move to archive:'
      @items.each_with_index do |item, index|
        puts "#{index + 1}. #{item.title}"
      end
      choice = gets.chomp.to_i

      if choice.between?(1, @items.size)
        item = @items[choice - 1]
        item.move_to_archive
      else
        puts 'Invalid choice. Please select a valid item.'
      end
    end
  end
end

ConsoleApp.new
