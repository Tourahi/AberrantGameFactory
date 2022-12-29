-- Modular and dynamic Node class that can have multiple
-- Nodes as children. A Game node can be a player, NPC ect.

import insert from table
import remove from table
import fork from assert require "utils"
import Uid from assert require "utils"
assert require "globals"


class Node
  --- constructor
  -- TODO : Params
  new: (name, x, y) =>

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

    @behaviours = {}

    @animate = nil
    @frame = nil

    @engineSprite = nil

    @colorFilter = {1, 1, 1, 1}

    @isStatic = false




  --- node name setter
  -- @tparam string name
  setName: (name) =>
    assert type(name) == 'string', "node name must be a string."
    @name = name

  --- node name getter
  getName: =>
    @name

  --- attaches a callback to onUpdate event
  -- @tparam function name
  attachUpdateEvent: (f) =>
    assert type(f) == 'function', "update event must be a function."
    @onUpdate = f

  --- add a child to a node
  -- @tparam Node child
  addChild: (child) =>
    assert child.__class == Node, "Child must be a Node."
    insert @children, child

  --- removes a child from a node
  -- @tparam Node child
  removeChild: (child) =>
    assert (child.__class == Node),
      "The child to be removed must be a node."
    remove @children, child

  --- forks a node
  -- @tparam string name
  forkNode: (name) =>
    local node
    node = fork self
    node.id = Uid!
    node\setName name or node\getName!
    node

  addBehaviour: (b) =>
    insert @behaviours, b

  removeBehaviour: (name) =>
    for i, b in ipairs @behaviours
      if b.name == name
        remove @behaviours, i
        break

  getBehaviour: (name) =>
    for i, b in ipairs @behaviours
      if b.name == name
        return b


  update: (dt) =>

    for _, b in ipairs @behaviours
      if b\getEnabled! then b\update(dt)

    if @animate ~= nil then @animate dt

    @updateChildren dt

  updateChildren: (dt) =>
    if #@children == 0 then return
    for _, child in ipairs(@children)
      child\update dt







