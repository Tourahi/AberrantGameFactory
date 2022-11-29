-- Modular and dynamic Node class that can have multiple
-- Nodes as children. A Game node can be a player, NPC ect.

import insert from table
import remove from table
import fork from assert require "utils"
assert require "globals"

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

    @onUpdate = {}

  setName: (name) =>
    assert type(name) == 'string', "node name must be a string."
    @name = name

  getName: =>
    @name

  attachUpdateEvent: (f) =>
    assert type(f) == 'function', "update event must be a function."
    @onUpdate = f

  addChild: (child) =>
    assert child.__class == Node, "Child must be a Node."
    insert @children, child

  removeChild: (child) =>
    assert (child.__class == Node),
      "The child to be removed must be a node."
    remove @children, child

  forkNode: (name) =>
    local node
    node = fork self
    node\setName name or node\getName!








