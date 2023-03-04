# the-odin-project-knight-travails

The task for this project is to create a function that shows the shortest possible way to get from one square to another by outputting 
all squares the knight piece will stop on along the way.

Example:

```
knight_moves([3, 3], [4, 3])
==> You made it in 3 moves! Here's your path:
[3, 3]
[4, 5]
[2, 4]
[4, 3]
```

To run the file navigate to the project's main directory and run the `bin` file:
```
ruby ./lib/knight_travails
```

### Project instructions:

1. Put together a script that creates a game board and a knight.

2. Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.

3. Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.

4. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. 

### Overview
The approach for this project is the following: 

1. The `Board` class represents a board. In this program its only purpose is to contain the informantion about its size to then
pass it to the manager when checking if moves are greater than the board.

2. The `Square` class represents a square in the board which contains a row and column coordinates.

3. The `Node` class represents a move. It holds a square and a previous node attribute to keep track of moves.

4. The `MoveManager` class represents the tree that holds nodes, or moves. It also has the logic for finding possible moves, finding parent nodes, and other move/node history attributes. The class could take other pieces that also hold a movility, so it is not restricted to the `Knight` class. It does not, however, support pieces such as a queen which movility would be hard to represent in coordinates.

5. The `Knight` class only contains its movility, which is then translated to squares at initialization. Then it leverages the move manager class to give the behavior intended for this project.
