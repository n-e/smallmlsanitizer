# SmallMlSanitizer

SmallMlSanitizer sanitizes user input to a small subset of html that
is safe for embedding in html documents, xml documents and tsv files.

As far as possible it tries to preserve the user input.

The output format should match the [validator.pegjs](https://github.com/n-e/smallmlvalidator/blob/master/validator.js)
which is included in the [SmallMlValidator](https://github.com/n-e/smallmlvalidator)
project.

## Compiling

No compiling is needed, and the precompiled grammar file is available as
validator.js.

There are no dependencies except for node.

## Running

### Command-line

    $ echo '<i>invalid <b>string</i>'| node index.js
    <i>invalid &lt;b&gt;string</i>

### As a node module

    var sanitizer = require('./sanitizer')
    sanitizer.parse(txt)

## License

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 2 **only**.
