local io = io
local random
random = math.random
local concat
concat = table.concat
local string = string
local fileReadAll
fileReadAll = function(file)
  local f = io.open(file, "rb")
  if f ~= nil then
    local data = f:read("*all")
    f:close()
    return data
  else
    Log.error("Unable to load file " .. file)
    return nil
  end
end
local fileExists
fileExists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end
local fork
fork = function(o, seen)
  if seen == nil then
    seen = { }
  end
  if o == nil then
    return nil
  end
  if seen[o] then
    return seen[o]
  end
  local newO = { }
  if type(o) == 'table' then
    seen[o] = newO
    for k, v in pairs(o) do
      newO[fork(k, seen)] = fork(v, seen)
    end
    setmetatable(newO, fork(getmetatable(o), seen))
  else
    newO = o
  end
  return newO
end
local randomString
randomString = function(len)
  if len == nil then
    len = 8
  end
  if len < 1 then
    return nil
  end
  local arr = { }
  for i = 1, len do
    arr[i] = string.char(random(97, 122))
  end
  return concat(arr)
end
return {
  fileReadAll = fileReadAll,
  fileExists = fileExists,
  fork = fork,
  randomString = randomString
}
