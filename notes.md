#Toy Robot Notes

##greet greets the user with the rules of the simulation then tranfers
##control to game_controller.
##Dependencies: greet knows that game_controller has a start method

##game_controller controls the robot simulation by acting as intermediary
##between the user and the robot.
##Dependencies: game_controller knows that robot has a create_robot method.

##robot moves the robot around the table by knowing and reporting its position.
##Dependencies: robot knows that game_controller has an instructions method.

###X and Y cannot be less than zero and cannot be more than 4

###Move when facing North means (y + 1)
###Move when facing South means (y - 1)
###Move when facing East means (x + 1)
###Move when facing West means (x - 1)

###Right S -> W, W -> N, N -> E, E -> S -> opposite to Left
###Left S -> E, E -> N, N -> W, W -> S -> opposite to Right

####Composition:attributes:
##Position
##Move forward
##Turn left
##Turn right
##Report ??


##Additional requirement added into Hooroo interview test:
###Toy Robot can move diagonally:
####Move from South to North diagonally means (x + 1) and (y + 1)
####Move from North to South diagonally means (x - 1) and (y - 1)
###Probably will allow robot to go backwards too
