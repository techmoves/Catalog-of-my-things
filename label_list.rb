require 'json'
class ListLabel
  def initialize
    @labels = []
  end

  def list_all_labels
    @labels.each do |label|
      puts "title: #{label.title}, color: #{label.color}"
    end
  end

  #   def add_label(title, color)
  #     label = Label.new(title, color)
  #     @labels.push(label)
  #     puts 'Label added.'
  #   end
  def add_label_menu
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    add_label(title, color)
  end

  def add_label(title, color, id = Time.now.to_f.to_s)
    new_label = Label.new(title, color, id)
    @labels << new_label if new_label.instance_of?(Label)
  end

  def save_labels
    labels = @labels.each_with_index.map do |label, index|
      {
        title: label.title, color: label.color, index: index
      }
    end
    File.write('label.json', JSON.generate(labels))
  end

  def load_labels
    return [] unless File.exist?('label.json')

    file = File.open('label.json')
    read_file = File.read(file)
    read_json = JSON.parse(read_file)
    loaded_labels = []
    read_json.each do |label|
      loaded_labels.push(Label.new(label['title'], label['color']))
    end
    file.close
    @labels = loaded_labels
  end
end
