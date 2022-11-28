assert require('busted.runner')()

import fileReadAll, fork from assert(require("src.utils.init"))

log = assert require "src.lib.lua.log.log"

describe 'fileReadAll(file)', ->

  it 'Reads the content of a file', ->
    fileName = "spec/data/test.txt"
    data = fileReadAll fileName
    assert.equals data, "1\n"

  it 'Returns nil', ->
    fileName = "spec/data/test.txts"
    data = fileReadAll fileName
    assert.equals data, nil


describe 'fork(o, seen)', ->

  it 'Forks the object', ->
    obj = {"aa": 299, "fdf": "salvo"}
    objFork = fork obj
    assert.are.same obj, objFork

  it 'Forks the class obj', ->
    point = class
      new: =>
        @x = 1
        @y = 2

      print: =>
        print @x .. " ," .. @y

    p1 = point!
    p2 = fork p1
    assert.are.same p1, p2


