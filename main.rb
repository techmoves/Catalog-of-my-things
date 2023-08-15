require_relative 'item'

class ConsoleApp
  def initialize
    @items = []
    main_menu
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def main_menu
    loop do
      puts 'Select an option:'
      puts '1. Add Item'
      puts '2. Move Item to Archive'
      puts '3. Add genre'
      puts '4. add_source_to_item_menu'
      puts '5. add_label_to_item_menu'
      puts '6. add_author_to_item_menu'
      puts '7. Quit'

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
        puts 'Goodbye!'
        break
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/CyclomaticComplexity
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

  #   def add_author_to_item(author)
  #     puts 'Enter author:'
  #     author = gets.chomp
  #     item.add_author(author)
  #     puts 'author added to the item.'
  #   end

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
