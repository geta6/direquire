# direquire

  require node scripts recursive.

  ![](https://nodei.co/npm/direquire.png)

  ![](https://travis-ci.org/geta6/direquire.png)


## Usage

  Start coding:

    $ npm i direquire

  Include in your project:

    direquire = require('direquire');

  Use:

    var module = direquire('./modules');


## How to use

  module named by object name e.g. `exports.moduleName`.

  nested module named by directory name.

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

  Execute:

    var modules = direquire('./modules');
    console.log(modules);

  Returns:

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
