-- Gives a node a defined behaviour when attached to it.


utils = assert require "utils"

class Behaviour
  --- constructor
  -- @tparam string name
  -- @tparam boolean enabled
  new: (name = "behaviour", enabled = true) =>
    @enabled = enabled

    @name = name
    @parentNode = nil
    @updateFunc = nil

  --- set the updateFunction
  -- @tparam function f
  onUpdate: (f) =>
    @updateFunc = f

  --- updates the behaviour
  -- @tparam number dt
  update: (dt) =>
    if @updateFunc and @enabled
      @updateFunc @, dt

  --- enable teh behaviour
  enable: =>
    @enabled = true

  --- disable teh behaviour
  disable: =>
    @enabled = false

  --- removes the behaviour from the parent class
  remove: =>
    return --@parentNode\removeBehaviour @
