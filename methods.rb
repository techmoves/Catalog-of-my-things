require 'json'
require_relative 'item'
require_relative 'genre'
require_relative 'music_album'

private

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
  save_music_albums_to_json
  puts 'Music album added.'
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
