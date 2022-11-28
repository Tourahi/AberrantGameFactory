-- Utils

io = io
import random from math
import concat from table

log = assert require "src.lib.lua.log.log"

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
    log.error "Unable to load file " .. file
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




{:fileReadAll, :fileExists, :fork, :randomString}
