phenoscaperb
======

[![Build Status](https://travis-ci.org/phenoscape/phenoscaperb.svg?branch=master)](https://travis-ci.org/phenoscape/phenoscaperb)

`phenoscaperb` is a low level client for the GBIF API

Other Phenoscape API clients:

- R: ...

## Changes

For changes see the [Changelog][changelog]

## API

xxx

* `/xx` - `Phenoscape::Registry.nodes`


## Install

### Release version

```
gem install phenoscaperb
```

### Development version

```
git clone git@github.com:sckott/phenoscaperb.git
cd phenoscaperb
rake install
```

## Examples, in Ruby repl

### Taxa module

```ruby
require 'phenoscaperb'
tax = Phenoscape::Taxa
tax.taxon(iri: "http://purl.obolibrary.org/obo/VTO_0067193")
```


## Meta

* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
* License: MIT

[phenoscapeapi]: https://www.gbif.org/developer/summary
[changelog]: https://github.com/sckott/phenoscaperb/blob/master/CHANGELOG.md
