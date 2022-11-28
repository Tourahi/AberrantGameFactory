assert require('busted.runner')()

import fileReadAll from assert(require("src.utils.init"))


describe 'fileReadAll(file)', ->

  it 'Reads the content of a file', ->
    fileName = "spec/data/test.txt"
    data = fileReadAll fileName
    assert.equals data, "1\n"

  it 'Returns nil', ->
    fileName = "spec/data/test.txts"
    data = fileReadAll fileName
    assert.equals data, nil


