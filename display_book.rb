module BookDisplay
  def display_books
    books = @items.select { |item| item.is_a?(Book) }

    puts 'Listing all books:'
    books.each do |book|
      puts "Title: #{book.title}, Published Year: #{book.published_year}, Cover State: #{book.cover_state}"
    end
  end

  # Add more display methods as needed
end
