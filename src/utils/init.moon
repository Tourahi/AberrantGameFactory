-- Utils

love = love

io = io
import random from math
import concat from table
import random from love.math


string = string

--- read the content of a file
-- @tparam string file
-- @treturn string
fileReadAll = (file) ->
  f = io.open file, "rb"
  if f ~= nil
    data = f\read "*all"
    f\close!
    data
  else
    Log.error "Unable to load file " .. file
    nil

--- tests if a file exists
-- @tparam string name
-- @treturn boolean
fileExists = (name) ->
  f = io.open name, "r"
  if f ~= nil
    io.close f
    true
  else
    false

--- forks an object (table, class)
-- @tparam table o
-- @tparam table seen
-- @treturn table
fork = (o, seen = {}) ->
  if o == nil then return nil
  if seen[o] then return seen[o]

  newO = {}
  if type(o) == 'table'
    seen[o] = newO
    for k, v in pairs o
      newO[fork(k, seen)] = fork v, seen
    setmetatable newO, fork(getmetatable(o), seen)
  else
    newO = o

  newO

--- generates a string with the lenght
-- @tparam number len
-- @treturn string
randomString = (len = 8) ->
  if len < 1 then return nil
  arr = {}

  for i = 1, len
    arr[i] = string.char random(97, 122)
  concat arr


-- Generates a unique id
Uid = ->
  f = (x) ->
    r = random(16) - 1
    r = (x == "x") and (r + 1) or (r % 4) + 9
    return ("0123456789abcdef")\sub r, r
  return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx")\gsub("[xy]", f))



{:fileReadAll, :fileExists, :fork, :randomString, :Uid}
