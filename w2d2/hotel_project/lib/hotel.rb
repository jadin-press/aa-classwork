require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = Hash.new
    rooms.each { |k, v| @rooms[k] = Room.new(v) }
  end

  def name
    @name.split(" ").map { |word| word.capitalize }.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
      puts "sorry, room does not exist"
    else
      @rooms[room_name].add_occupant(person) ? (puts "check in successful") : (puts "sorry, room is full")
    end
  end

  def has_vacancy?
    @rooms.any? { |k, v| !v.full? }
  end

  def list_rooms
    @rooms.each do |k, v|
      puts "#{k} #{v.available_space}"
    end
  end
end
