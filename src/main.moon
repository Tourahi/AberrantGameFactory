assert require "globals"

node = assert require "node"
event = assert require "event"

engine = assert require "engine"


with love
  .load = ->
    -- n = node 'testNode'
    -- local n1
    -- print Log.t(n)
    -- n1 = n\forkNode 'lol'
    -- print Log.t(n1)

    event.define 'l', 'lool'

    e = event!

    print Log.t(event.eventsDef)

  .update = (dt) ->
    engine\update dt

  .keypressed = (key, scancode, isrepeat) ->
    engine\keypressed key

  .keyreleased = (key) ->
    engine\keyreleased key

  .mousepressed = (x, y, button, isTouch) ->
    engine\mousepressed x, y, button

  .mousereleased = (x, y, button, isTouch) ->
    engine\mousereleased x, y, button

  .wheelmoved = (x, y) ->
    engine\wheelmoved x, y

