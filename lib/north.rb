class North

  def self.move(x_coordinate, y_coordinate, direction)
    table_edge(x_coordinate, y_coordinate, direction) unless y_coordinate < 4
    y_coordinate += 1 unless y_coordinate >= 4
    [x_coordinate, y_coordinate, direction.to_s.upcase]
  end

  def self.left(x_coordinate, y_coordinate, direction)
    direction = "WEST"
    [x_coordinate, y_coordinate, direction.to_s.upcase]
  end

  def self.right(x_coordinate, y_coordinate, direction)
    direction = "EAST"
    [x_coordinate, y_coordinate, direction.to_s.upcase]
  end

  def self.table_edge(x_coordinate, y_coordinate, direction)
      puts "You can't move the robot off the table" 
  end
end
