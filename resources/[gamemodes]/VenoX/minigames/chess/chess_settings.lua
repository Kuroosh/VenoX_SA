settings = {}
settings.fieldXSize = 50
settings.fieldYSize = 50

chessFigureImages = {}
	chessFigureImages[1] = "pawn"
	chessFigureImages[2] = "castle"
	chessFigureImages[3] = "knight"
	chessFigureImages[4] = "bishop"
	chessFigureImages[5] = "queen"
	chessFigureImages[6] = "king"

kingMovementPosition = {}
	kingMovementPosition["x"] = {}
	kingMovementPosition["y"] = {}
		local i = 0
		i = i + 1
		kingMovementPosition["x"][i] = 1
		kingMovementPosition["y"][i] = -1
		i = i + 1
		kingMovementPosition["x"][i] = -1
		kingMovementPosition["y"][i] = 1
		i = i + 1
		kingMovementPosition["x"][i] = -1
		kingMovementPosition["y"][i] = -1
		i = i + 1
		kingMovementPosition["x"][i] = -1
		kingMovementPosition["y"][i] = 0
		i = i + 1
		kingMovementPosition["x"][i] = 0
		kingMovementPosition["y"][i] = -1
		i = i + 1
		kingMovementPosition["x"][i] = 1
		kingMovementPosition["y"][i] = 0
		i = i + 1
		kingMovementPosition["x"][i] = 0
		kingMovementPosition["y"][i] = 1
		i = i + 1
		kingMovementPosition["x"][i] = 1
		kingMovementPosition["y"][i] = 1

knightJumpPossibility = {}
	knightJumpPossibility["x"] = {}
	knightJumpPossibility["y"] = {}
		local i = 0
		i = i + 1
		knightJumpPossibility["x"][i] = 1
		knightJumpPossibility["y"][i] = 2
		i = i + 1
		knightJumpPossibility["x"][i] = 2
		knightJumpPossibility["y"][i] = 1
		i = i + 1
		knightJumpPossibility["x"][i] = -1
		knightJumpPossibility["y"][i] = 2
		i = i + 1
		knightJumpPossibility["x"][i] = -2
		knightJumpPossibility["y"][i] = 1
		i = i + 1
		knightJumpPossibility["x"][i] = 1
		knightJumpPossibility["y"][i] = -2
		i = i + 1
		knightJumpPossibility["x"][i] = 2
		knightJumpPossibility["y"][i] = -1
		i = i + 1
		knightJumpPossibility["x"][i] = -1
		knightJumpPossibility["y"][i] = -2
		i = i + 1
		knightJumpPossibility["x"][i] = -2
		knightJumpPossibility["y"][i] = -1

--[[
x = Black
0 = White

In the game, the fields are swapped - 8 is 1, 7 is 2 and so on.




	a	b	c	d	e	f	g	h

1	0	x	0	x	0	x	0	x

2	x	0	x	0	x	0	x	0

3	0	x	0	x	0	x	0	x

4	x	0	x	0	x	0	x	0

5	0	x	0	x	0	x	0	x

6	x	0	x	0	x	0	x	0

7	0	x	0	x	0	x	0	x

8	x	0	x	0	x	0	x	0



]]