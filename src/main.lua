local node = assert(require("node"))
do
  local _with_0 = love
  _with_0.load = function()
    local n = node()
  end
  return _with_0
end
