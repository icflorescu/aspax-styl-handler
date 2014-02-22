fs     = require 'fs'
path   = require 'path'

stylus = require 'stylus'
nib    = require 'nib'

regex = ///
  @import\s+      # @import followed by one or more whitespace chars
  (?:             # don't capture this group
    ['"]          # single or double quote
    ([^'"]+)      # capture chars except single or double quote
    |             # ...or...
    ([^\s;]+)     # capture chars except whitespace or semicolon
  )
///gi

exports.findImports = findImports = (imports, file, callback) ->
  await fs.readFile file, 'utf8', defer err, contents
  return callback err if err

  newImports = []
  while match = regex.exec contents
    item = match[1] or match[2]
    item += '.styl' if path.extname(item) is ''
    item = path.resolve path.dirname(file), item
    unless item in imports
      newImports.push item
      imports.push    item

  for item in newImports
    await findImports imports, item, defer err
    return callback err if err

  callback()

exports.compile = (file, flags, callback) ->
  await fs.readFile file, 'utf8', defer err, contents
  return callback err if err
  compiler = stylus(contents).set('filename', file).set('compress', no)
  compiler.use(nib()).import('nib') if 'nib' in flags
  compiler.render callback
