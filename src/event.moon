-- Event sys

import Uid from assert require "utils"
import insert from table
import eventF from assert require "debugFlags"

class Event

  --- Events definitions(names)
  --- {event: name}
  @eventsDef: {}

  @registerOnAttach: false

  --- Define an event: you can attache handlers to it and dispatch it
  @define: (event, name) ->
    assert type(event) == 'string',
      "Event must be of type string."
    assert type(name) == 'string',
      "Name must be of type string."

    @@eventsDef[event] = name

    if eventF then Log.trace "New event defined: " .. name

  --- getter for an event from event constants table.
  -- @tparam string ename
  -- @treturn string
  @getEvent: (ename) ->
    assert type(ename) == 'string',
      "Event name must be of type string."
    @@eventsDef[ename]

  --- getter for an event from event constants table.
  -- @tparam string ename
  -- @treturn string
  getEvent: (ename) =>
    assert type(ename) == 'string',
      "Event name must be of type string."
    @@eventsDef[ename]


  --- constructor
  new: =>
    -- Handlers to run when an event is triggered
    -- { "eventName": {...}, ... }
    @handlers = {}

  --- drops all the handlers of an event.
  drop: =>
    @handlers = {}


  register: (name) =>
    e = @getEvent name
    if e == nil and @@registerOnAttach == true
      @@define name, name
      @handlers[name] = {}
    elseif e == nil and @@registerOnAttach == false
      error "Attaching a handler to an undefined event."

    @handlers[name] = {}


  on: (name, callback, target) =>
    assert type(name) == 'string',
      "Event name must be of type string."
    assert type(callback) == 'function',
      "Callback must be a function."
    assert type(target) == 'table',
      "Target must be a table."

    if not @handlers[name] then @register name
    local hdlr

    hdlr = {
      id: Uid!
      callback: callback
      target: target
    }

    insert @handlers[name], hdlr

    hdlr

  remove: (event, id) =>
    _event = @getEvent(event)
    if @handlers[_event] == nil then return
    for i = 1, #@handlers[_event]
      h = @handlers[_event][i]
      if h.id == id
        @handlers[@getEvent(event)][i] = nil
        return


  dispatch: (name, ...) =>
    assert type(name) == 'string',
      "Event name must be of type string."

    hdlrs = @handlers[name]
    if not hdlrs then return false
    for i = 1, #hdlrs
      handler = hdlrs[i]
      if handler.callback
        if handler.target
          if handler.callback(handler.target, ...)
            return true
        else
          if handler.callback(...)
            return true

    return false







