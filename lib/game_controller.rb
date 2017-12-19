require "./lib/robot"
class GameController

  private

  def self.start_simulation
    puts "Enter 'PLACE X,Y,F' to start the simulation:"
    @position = gets.chomp
    validate_position
  end

  def self.validate_position
    if @position.match(/PLACE\s[01234]\,[01234]\,NORTH|SOUTH|EAST|WEST/)
      coordinates = create_coordinates(@position)
      @robot = Robot.new(coordinates[0].to_i, coordinates[1].to_i, coordinates[2])
    else
      @position = gets.chomp
      validate_position
    end
  end

  def self.create_coordinates(position)
    coordinates = position.split(" ")[1]
    coordinates = coordinates.split(",")
  end

  def self.simulation_actions
    puts "Enter MOVE to move robot forward one position"
    puts "Enter LEFT to turn robot left in position"
    puts "Enter RIGHT to turn robot right in position"
    puts "Enter REPORT to see the robot's position"
    puts "Enter EXIT to leave the simulation"
    action = gets.chomp
    set_action(action)
  end

  def self.set_action(action)
    case action
    when "MOVE"
      @robot.perform_action("move")
    when "LEFT"
      @robot.perform_action("left")
    when "RIGHT"
      @robot.perform_action("right")
    when "REPORT"
      @robot.report
    when "EXIT"
      return
    end
    if action.match(/PLACE\s[01234]\,[01234]\,NORTH|SOUTH|EAST|WEST/)
      coordinates = create_coordinates(action)
      @robot.new_position(coordinates)
    end
    simulation_actions
  end
end
