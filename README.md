phenoscaperb
======

[![Build Status](https://travis-ci.org/phenoscape/phenoscaperb.svg?branch=master)](https://travis-ci.org/phenoscape/phenoscaperb)

`phenoscaperb` is a low level client for the GBIF API

Other Phenoscape API clients:

- R: ...

## Changes

For changes see the [Changelog][changelog]

## API

Taxa

* `/taxa` - `Phenoscape::Taxon.taxon`
* `/taxon/with_rank` - `Phenoscape::Taxon.taxon_with_rank`

Ontotrace

* `/taxa` - `Phenoscape::Ontotrace.ontotrace`

## Install

### Development version

```
git clone git@github.com:phenoscape/phenoscaperb.git
cd phenoscaperb
rake install
```

## Meta

* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
* License: MIT

[phenoscapeapi]: https://www.gbif.org/developer/summary
[changelog]: https://github.com/sckott/phenoscaperb/blob/master/CHANGELOG.md
