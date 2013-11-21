path = require 'path'
direquire = require '../'

describe 'direquire', ->

  m1 = direquire path.resolve 'tests', 'modules', 'module1'
  m2 = direquire path.resolve 'tests', 'modules'

  it 'should be require from directory', (done) ->
    unless m1.Module11? and typeof m1.Module11 is 'function'
      return done 'Module11 (module1/module11.coffee) not required correctly'
    unless m1.Module12? and typeof m1.Module12 is 'function'
      return done 'Module12 (module1/module12.coffee) not required correctly'
    return done()

  it 'should be require same namespace', (done) ->
    unless m2.Module1? and typeof m2.Module1 is 'function'
      return done 'Module1 (module1.coffee) not required correctly'
    unless typeof m2.module1 is 'object'
      return done 'module1 (module1/) not resolved'
    unless m2.module2? and typeof m2.module2 is 'function'
      return done 'module2 (module2/ & module2/*) namespace not resolved'
    unless m2.module2.module21? and typeof m2.module2.module21 is 'function'
      return done 'module21 (module2/module21.coffee) not required correctly'
    unless m2.module2.module22? and typeof m2.module2.module22 is 'function'
      return done 'module21 (module2/module22.coffee) not required correctly'
    return done()

  it 'should not be require single file', (done) ->
    try
      direquire path.resolve 'tests', 'modules', 'module1', 'module11'
    catch e
      return done()
    done new Error 'required'

