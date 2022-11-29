export *

-- Logs in the console
Log = assert require "src.lib.lua.log.log"

love = love

import random from love.math


-- Generates a unique id
Uid = ->
  f = (x) ->
    r = random(16) - 1
    r = (x == "x") and (r + 1) or (r % 4) + 9
    return ("0123456789abcdef")\sub r, r
  return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx")\gsub("[xy]", f))
