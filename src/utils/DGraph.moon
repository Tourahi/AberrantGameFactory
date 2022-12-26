
import floor from math
import ceil from math
import insert from table
import remove from table
import timer from love
import graphics from love

class DGraph
  new: (type, x = 0, y = 0, w = 50, h = 30, delay, label, font = graphics.newFont(8)) =>

    if  ({mem:0, fps:0, custom:0, c:0})[type] == nil
      error 'Acceptable types: mem, fps, custom/c'

    @x = x
    @y = y
    @w = w
    @h = h
    @data = {}
    @max = 0
    @time = 0
    @type = type
    @label = label or type
    @font = font

    @delay = 0.4

    for _ = 0, floor (@w / 2)
      insert @data, 0


  update: (dt, v) =>
    local prevTime
    prevTime = @time

    @time = (@time + dt) % @delay

    if dt > @delay or prevTime > @time
      if v == nil
        if @type == 'fps'
          v = 0.75 * 1 / dt + 0.25 * timer.getFPS!
          @label = "FPS: " .. floor(v * 10) / 10
        elseif @type == 'mem'
          v = collectgarbage('count')
          @label = "Memory (KB): " .. floor(v * 10) / 10
        else
          return

      remove(@data, 1)
      insert(@data, v)

    local max
    max = 0

    for i=1, #@data
      local v
      v = @data[i]
      if v > max then max = v

    @max = max

  draw: =>
    oldFont = graphics.getFont!
    graphics.setFont @font

    max = ceil(@max/10) * 10 + 20
    len = #@data
    steps = @w / len

    local linePoints
    linePoints = {}

    for i=1, len
      local x, y
      x = steps * (i - 1) + @x
      y = @h * (-@data[i] / max + 1) + @y

      insert linePoints, x
      insert linePoints, y

    graphics.line unpack(linePoints)

    if @label ~= ''
      graphics.print @label, @x, @y + @h - @font\getHeight!

    graphics.setFont oldFont





