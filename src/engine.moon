
Node = assert require 'node'
Singleton = assert require 'singleton'
Input = assert require 'lib.Input_Moon.Input'


class Engine extends Singleton

  new: =>

    @debugEnabled = true
    @editingMode = true
    @input = Input!

    @init!


  init: =>
    if @editingMode
      @cam = nil

      -- TODO include editor callbacks


  update: (dt) =>
    @input\update dt

  keypressed: (key, scancode, isrepeat) =>
    @input\keypressed key

  keyreleased: (key) =>
    @input\keyreleased key

  mousepressed: (x, y, button, isTouch) =>
    @input\mousepressed x, y, button

  mousereleased: (x, y, button, isTouch) =>
    @input\mousereleased x, y, button

  wheelmoved: (x, y) =>
    @input\wheelmoved x, y


Engine.getInstance!
