phenoscaperb
======

[![gem version](https://img.shields.io/gem/v/phenoscaperb.svg)](https://rubygems.org/gems/phenoscaperb)
[![Build Status](https://travis-ci.org/sckott/phenoscaperb.svg?branch=master)](https://travis-ci.org/sckott/phenoscaperb)
[![codecov.io](http://codecov.io/github/sckott/phenoscaperb/coverage.svg?branch=master)](http://codecov.io/github/sckott/phenoscaperb?branch=master)

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
