## What's this?
A plugin that enables [ASPAX](http://aspax.github.io) to handle [Stylus](http://learnboost.github.io/stylus) files.

## Installation
Type this in the folder where you're running ASPAX:

    npm install aspax-styl-handler

If you're running ASPAX in a Node.js application root folder, consider using the `--save-dev` option to avoid deploying this plugin to your production environment:

    npm install aspax-styl-handler --save-dev

## Usage
Simply add `.styl` source files in `aspax.yml`:

    app.css:
      - lib.css
      - styles-1.styl
      - script-2.styl|nib

## Available flags

- `nib`: include support for nib CSS3 extensions - see more [here](http://visionmedia.github.io/nib).

  With nib enabled, something like this:

        button
          border-radius 1px 2px / 3px 4px

        button
          border-radius 5px

        button
          border-radius bottom 10px

  ...will yield:

        button {
          -webkit-border-radius: 1px 2px/3px 4px;
          -moz-border-radius: 1px 2px/3px 4px;
          border-radius: 1px 2px/3px 4px;
        }

        button {
          -webkit-border-radius: 5px;
          -moz-border-radius: 5px;
          border-radius: 5px;
        }

        button {
          -moz-border-radius-topleft: 10px;
          -webkit-border-top-left-radius: 10px;
          border-top-left-radius: 10px;
          -moz-border-radius-bottomright: 10px;
          -webkit-border-bottom-right-radius: 10px;
          border-bottom-right-radius: 10px;
        }

## What about watching for imported files?
This plugin is smart enough to recursively scan for `@import` statements and automatically trigger ASPAX to rebuild the parrent asset if one of the files in your import tree changes.

## Endorsing the author
If you find this piece of software useful, please [![endorse](https://api.coderwall.com/icflorescu/endorsecount.png)](https://coderwall.com/icflorescu) me on Coderwall!
