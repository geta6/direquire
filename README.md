  direquire enables to require scripts recursive.

## Requirement

  * node.js


## Quick Start

  Start coding:

    $ npm install direquire

  Include in your project:

    direquire = require('direquire');

  Use:

    var module = direquire('./modules');


## How to use


  module named `exports.moduleName`.

  nested module named `directory name`.

  Example:

    modules/
    ├── module1
    │   ├── module11.coffee (exports.Module11 = ->)
    │   └── module12.coffee (exports.Module12 = ->)
    ├── module1.coffee      (exports.Module1 = ->)
    ├── module2
    │   ├── module21.coffee (exports.module21 = ->)
    │   └── module22.coffee (exports.module22 = ->)
    └── module2.coffee      (exports.module2 = ->)

  ※ `module2.coffee` exports the same name as directory.

  Execute:

    direquire('./modules');

  Returned:

    {
      module1: {
        Module11: [Function],
        Module12: [Function]
      },
      Module1: [Function],
      module2: {
        [Function]
        module21: [Function],
        module22: [Function]
      }
    }
