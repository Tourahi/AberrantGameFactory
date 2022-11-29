assert(require('busted.runner')())
local fileReadAll, fork
do
  local _obj_0 = assert(require("src.utils.init"))
  fileReadAll, fork = _obj_0.fileReadAll, _obj_0.fork
end
_G.love = {
  math = { }
}
assert(require("src.globals"))
describe('fileReadAll(file)', function()
  it('Reads the content of a file', function()
    local fileName = "spec/data/test.txt"
    local data = fileReadAll(fileName)
    return assert.equals(data, "1\n")
  end)
  return it('Returns nil', function()
    local fileName = "spec/data/test.txts"
    local data = fileReadAll(fileName)
    return assert.equals(data, nil)
  end)
end)
return describe('fork(o, seen)', function()
  it('Forks the object', function()
    local obj = {
      ["aa"] = 299,
      ["fdf"] = "salvo"
    }
    local objFork = fork(obj)
    return assert.are.same(obj, objFork)
  end)
  return it('Forks the class obj', function()
    local point
    do
      local _class_0
      local _base_0 = {
        print = function(self)
          return print(self.x .. " ," .. self.y)
        end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
        __init = function(self)
          self.x = 1
          self.y = 2
        end,
        __base = _base_0,
        __name = "point"
      }, {
        __index = _base_0,
        __call = function(cls, ...)
          local _self_0 = setmetatable({}, _base_0)
          cls.__init(_self_0, ...)
          return _self_0
        end
      })
      _base_0.__class = _class_0
      point = _class_0
    end
    local p1 = point()
    local p2 = fork(p1)
    return assert.are.same(p1, p2)
  end)
end)
