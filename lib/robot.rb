require "./lib/north"
require "./lib/south"
require "./lib/east"
require "./lib/west"

class Robot

  attr_accessor :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def perform_action(action)
    robot_direction = direction.downcase.capitalize
    position = self.instance_eval("#{robot_direction}.#{action}(#{x_coordinate}, #{y_coordinate}, #{robot_direction})")
    new_position(position)
  end

  def new_position(position)
    self.x_coordinate = position[0]
    self.y_coordinate = position[1]
    self.direction = position[2]
  end

  def report
    puts "#{x_coordinate},#{y_coordinate},#{direction}"
  end
end
