local insert
insert = table.insert
local remove
remove = table.remove
local fork
fork = assert(require("utils")).fork
assert(require("globals"))
local Uid = Uid
local Node
do
  local _class_0
  local _base_0 = {
    setName = function(self, name)
      assert(type(name) == 'string', "node name must be a string.")
      self.name = name
    end,
    getName = function(self)
      return self.name
    end,
    attachUpdateEvent = function(self, f)
      assert(type(f) == 'function', "update event must be a function.")
      self.onUpdate = f
    end,
    addChild = function(self, child)
      assert(child.__class == Node, "Child must be a Node.")
      return insert(self.children, child)
    end,
    removeChild = function(self, child)
      assert((child.__class == Node), "The child to be removed must be a node.")
      return remove(self.children, child)
    end,
    forkNode = function(self, name)
      local node
      node = fork(self)
      return node:setName(name or node:getName())
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, name, x, y, owner)
      if owner == nil then
        owner = nil
      end
      self.id = Uid()
      self.name = name
      self.children = { }
      self.visible = true
      self.x = x
      self.y = y
      self.sx = 1
      self.sY = 1
      self.rot = 0
      self.px = 0
      self.py = 0
      self.ox = 0
      self.oy = 0
      self.layer = 1
      self.onUpdate = { }
    end,
    __base = _base_0,
    __name = "Node"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Node = _class_0
  return _class_0
end
