-- Utils

io = io
import random from math
import concat from table

log = assert require "src.lib.log.log"

--- read the content of a file
-- @tparam string file
fileReadAll = (file) ->
  f = io.open file, "rb"
  if f ~= nil
    data = f\read "*all"
    f\close!
    data
  else
    log.error "Unable to load file " .. file
    nil




{:fileReadAll}
