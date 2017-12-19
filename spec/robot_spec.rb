require "./lib/robot"
require "./lib/game_controller"

describe Robot do

  it "can take a position on the table" do
    robot = Robot.new(1,2,"EAST")

    expect { robot.report }.to output("1,2,EAST\n").to_stdout
  end

  context "when facing NORTH" do

    it "can move forward one position" do
      robot = Robot.new(1, 2, "NORTH")
      robot.perform_action("move")

      expect { robot.report }.to output("1,3,NORTH\n").to_stdout
    end

    it "can turn left in position" do
      robot = Robot.new(1, 2, "NORTH")
      robot.perform_action("left")

      expect { robot.report }.to output("1,2,WEST\n").to_stdout
    end

    it "can turn right in position" do
      robot = Robot.new(1, 2, "NORTH")
      robot.perform_action("right")

      expect { robot.report }.to output("1,2,EAST\n").to_stdout
    end

    it "can take a new position after simulation starts" do
      robot = Robot.new(1, 2, "NORTH")
      robot.new_position([1, 3, "WEST"])

      expect { robot.report }.to output("1,3,WEST\n").to_stdout
    end

    it "can't move off the table" do
      robot = Robot.new(1, 4, "NORTH")

      expect { robot.perform_action("move") }.to output("You can't move the robot off the table\n").to_stdout
      expect { robot.report }.to output("1,4,NORTH\n").to_stdout
    end
  end

  context "when facing SOUTH" do

    it "can move forward one position" do
      robot = Robot.new(1, 2, "SOUTH")
      robot.perform_action("move")

      expect { robot.report }.to output("1,1,SOUTH\n").to_stdout
    end

    it "can turn left in position" do
      robot = Robot.new(1, 2, "SOUTH")
      robot.perform_action("left")

      expect { robot.report }.to output("1,2,EAST\n").to_stdout
    end

    it "can turn right in position" do
      robot = Robot.new(1, 2, "SOUTH")
      robot.perform_action("right")

      expect { robot.report }.to output("1,2,WEST\n").to_stdout
    end

    it "can take a new position after simulation starts" do
      robot = Robot.new(1, 2, "SOUTH")
      robot.new_position([1, 3, "EAST"])

      expect { robot.report }.to output("1,3,EAST\n").to_stdout
    end

    it "can't move off the table" do
      robot = Robot.new(2, 0, "SOUTH")

      expect { robot.perform_action("move") }.to output("You can't move the robot off the table\n").to_stdout
      expect { robot.report }.to output("2,0,SOUTH\n").to_stdout
    end
  end

  context "when facing EAST" do

    it "can move forward one position" do
      robot = Robot.new(1, 2, "EAST")
      robot.perform_action("move")

      expect { robot.report }.to output("2,2,EAST\n").to_stdout
    end

    it "can turn left in position" do
      robot = Robot.new(1, 2, "EAST")
      robot.perform_action("left")

      expect { robot.report }.to output("1,2,NORTH\n").to_stdout
    end

    it "can turn right in position" do
      robot = Robot.new(1, 2, "EAST")
      robot.perform_action("right")

      expect { robot.report }.to output("1,2,SOUTH\n").to_stdout
    end

    it "can take a new position after simulation starts" do
      robot = Robot.new(1, 2, "EAST")
      robot.new_position([2, 3, "SOUTH"])

      expect { robot.report }.to output("2,3,SOUTH\n").to_stdout
    end

    it "can't move off the table" do
      robot = Robot.new(4, 3, "EAST")

      expect { robot.perform_action("move") }.to output("You can't move the robot off the table\n").to_stdout
      expect { robot.report }.to output("4,3,EAST\n").to_stdout
    end
  end

  context "when facing WEST" do
    it "can move forward one position" do
      robot = Robot.new(1, 2, "WEST")
      robot.perform_action("move")

      expect { robot.report }.to output("0,2,WEST\n").to_stdout
    end

    it "can turn left in position" do
      robot = Robot.new(1, 2, "WEST")
      robot.perform_action("left")

      expect { robot.report }.to output("1,2,SOUTH\n").to_stdout
    end

    it "can turn right in position" do
      robot = Robot.new(1, 2, "WEST")
      robot.perform_action("right")

      expect { robot.report }.to output("1,2,NORTH\n").to_stdout
    end

    it "can take a new position after simulation starts" do
      robot = Robot.new(1, 2, "WEST")
      robot.new_position([2, 3, "NORTH"])

      expect { robot.report }.to output("2,3,NORTH\n").to_stdout
    end

    it "can't move off the table" do
      robot = Robot.new(0, 3, "WEST")

      expect { robot.perform_action("move") }.to output("You can't move the robot off the table\n").to_stdout
      expect { robot.report }.to output("0,3,WEST\n").to_stdout
    end
  end
end
