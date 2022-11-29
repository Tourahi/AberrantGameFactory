assert require "globals"

node = assert require "node"


with love
  .load = ->
    n = node 'testNode'
    local n1
    print Log.t(n)
    n1 = n\forkNode 'hasan'
    print Log.t(n1)




