--- Leak (Memory leak detector)


export Leak = {}

Globals = _G
GlobalTypes = nil
event = love.event

isClass = (o) ->
  local className
  className = nil

  if type(o) ~= "userdata" and o.__class ~= nil
    className = o.__class.__name
  if className ~= nil
    return className
  className


with Leak
  .countAll = (f) ->
    seen = {}

    countObject = (o) ->
      if seen[o] then return
      f(o)
      seen[o] = true
      for _, v in pairs o
        if type(v) == "table"
          if v == event then return
          countObject v
        elseif type(v) == "userdata"
          f v

    countObject Globals


  .getType = (o) ->
    if GlobalTypes == nil
      GlobalTypes = {}
      for k, v in pairs _G
        GlobalTypes[v] = k
      GlobalTypes[0] = "table"

    className = isClass(o)

    if className ~= nil
      return className

    GlobalTypes[getmetatable(o) or 0] or "Unknown"

  .typeCount = ->
    counts = {}
    enum = (o) ->
      if o == event then return
      t = Leak.getType o

      if type(o) == "table" and o.__class
        if getmetatable(o) ~= nil and o.__base == nil
          counts[t] = (counts[t] or 0) + 1
      else
        counts[t] = (counts[t] or 0) + 1

    Leak.countAll enum
    counts

  .report = (cb = nil) ->
    counts = Leak.typeCount!
    if cb
      print '--------------Entities count-----------'
      for k, v in pairs counts
        cb k, v
      print '-------------------------------------'
    else
      print '--------------Entities count-----------'
      for k, v in pairs counts
        print k .. ' : ' .. v
      print '-------------------------------------'

