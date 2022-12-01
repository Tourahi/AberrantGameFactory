assert require "globals"

node = assert require "node"

engine = assert require "engine"


with love
  .load = ->
    n = node 'testNode'
    local n1
    print Log.t(n)
    n1 = n\forkNode 'lol'
    print Log.t(n1)




