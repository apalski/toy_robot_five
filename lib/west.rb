class West

  def self.move(x_coordinate, y_coordinate, direction)
    table_edge(x_coordinate, y_coordinate, direction) unless x_coordinate > 0
    x_coordinate -= 1 unless x_coordinate <= 0
    [x_coordinate, y_coordinate, direction.to_s.upcase]
  end

  def self.left(x_coordinate, y_coordinate, direction)
    direction = "SOUTH"
    [x_coordinate, y_coordinate, direction.to_s.upcase]
  end

  def self.right(x_coordinate, y_coordinate, direction)
    direction = "NORTH"
    [x_coordinate, y_coordinate, direction.to_s.upcase]
  end

  def self.table_edge(x_coordinate, y_coordinate, direction)
      puts "You can't move the robot off the table"
  end
end
