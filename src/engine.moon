
Node = assert require 'node'
Singleton = assert require 'singleton'


class Engine extends Singleton

  new: =>

    @debugEnabled = true
    @editingMode = true

    @init!


  init: =>
    if @editingMode
      @cam = nil

      -- TODO include editor callbacks

