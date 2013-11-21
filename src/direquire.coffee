fs   = require 'fs'
path = require 'path'
{exec} = require 'child_process'

direquire = (dir) ->

  if '/' isnt dir.substr 0, 1
    dir = path.resolve dir

  modules = {}

  unless fs.existsSync dir
    throw new Error "ENOTEXISTS #{dir}"
    return modules = {}

  for list in fs.readdirSync dir
    filepath = path.join dir, list
    if fs.statSync(filepath).isDirectory()
      unless (path.basename filepath).match /^\./
        modules[path.basename filepath] = direquire filepath
    else if /^[^\.].*\.(coffee|js|json)$/.test list
      for name, body of require filepath
        if typeof modules[name] isnt 'undefined'
          body[key] = val for key, val of modules[name]
        modules[name] = body

  return modules

module.exports = direquire

