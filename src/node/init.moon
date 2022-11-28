-- Modular and dynamic Node class that can have multiple
-- Nodes as children. A Game node can be a player, NPC ect.

Uid = Uid


class Node
  new: (name, x, y, owner = nil) =>

    @id = Uid!
    @name = name
    @children = {}

    @visible = true

    -- Coords (parent related)
    @x = x
    @y = y

    @sx = 1
    @sY = 1

    @rot = 0

    @px = 0
    @py = 0

    @ox = 0
    @oy = 0

    @layer = 1



