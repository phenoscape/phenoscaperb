phenoscaperb
============

[![gem version](https://img.shields.io/gem/v/phenoscaperb.svg)](https://rubygems.org/gems/phenoscaperb)
[![Build Status](https://travis-ci.org/phenoscape/phenoscaperb.svg?branch=master)](https://travis-ci.org/phenoscape/phenoscaperb)
[![codecov.io](http://codecov.io/github/phenoscape/phenoscaperb/coverage.svg?branch=master)](http://codecov.io/github/phenoscape/phenoscaperb?branch=master)

`phenoscaperb` is a low level client for the [Phenoscape API][phenoscapeapi]

[Phenoscape][] is a datastore of computable phenotypes for studies of evolution and genetics.

## Changes

For changes see the [Changelog][changelog]

## API

Taxa

* `/taxon` - `Phenoscape::Taxon.taxon`
* `/taxon/with_rank` - `Phenoscape::Taxon.taxon_with_rank`
* `/taxon/with_phenotype` - `Phenoscape::Taxon.with_phenotype`
* `/taxon/annotations` - `Phenoscape::Taxon.annotations`

Genes

* `/gene` - `Phenoscape::Gene.gene`
* `/gene/search` - `Phenoscape::Gene.search`
* `/gene/affecting_entity_phenotype` - `Phenoscape::Gene.affecting_entity_phenotype`

Terms

* `/term` - `Phenoscape::Terms.term`
* `/term/search` - `Phenoscape::Terms.search`
* `/term/search_classes` - `Phenoscape::Terms.search_classes`
* `/term/label` - `Phenoscape::Terms.label`
* `/term/labels` - `Phenoscape::Terms.labels`
* `/term/classification` - `Phenoscape::Terms.classification`
* `/term/all_ancestors` - `Phenoscape::Terms.all_ancestors`
* `/term/all_descendants` - `Phenoscape::Terms.all_descendants`
* `/term/least_common_subsumers` - `Phenoscape::Terms.least_common_subsumers`

Ontotrace

* `/ontotrace` - `Phenoscape::Ontotrace.ontotrace`

Studies

* `/studies/query` - `Phenoscape::Studies.query`
* `/studies/taxa` - `Phenoscape::Studies.taxa`
* `/studies/phenotypes` - `Phenoscape::Studies.phenotypes`
* `/studies/matrix` - `Phenoscape::Studies.matrix`

## Install

### Development version

```
git clone git@github.com:phenoscape/phenoscaperb.git
cd phenoscaperb
rake install
```

### Release version

```
gem install phenoscaperb
```

## Setup

This is most likely not needed ...

You can swap out the base URL by passing named options in a block to `Phenoscape.configuration`.

This will also be the way to set up other user options, if any are needed down the road (though `base_url` is the only one right now).

```ruby
Phenoscape.configuration do |config|
  config.base_url = "the new url"
end
```

## in Ruby

A few examples

`Phenoscape::Taxa.taxon`

```ruby
require 'phenoscaperb'
tax = Phenoscape::Taxa
tax.taxon(iri: "http://purl.obolibrary.org/obo/VTO_0067193")
#> => {"rank"=>{"@id"=>"http://purl.obolibrary.org/obo/TAXRANK_0000006", "label"=>"species"},
#>  "label"=>"Apterichtus equatorialis",
#>  "extinct"=>false,
#>  "common_name"=>"Finless eel",
#>  "@id"=>"http://purl.obolibrary.org/obo/VTO_0067193"}
```

`Phenoscape::Genes.gene`

```ruby
require 'phenoscaperb'
ge = Phenoscape::Genes
ge.gene(iri: "http://www.informatics.jax.org/marker/MGI:104842")
#> => {"@id"=>"http://www.informatics.jax.org/marker/MGI:104842", "label"=>"Coil", "taxon"=>{"@id"=>"http://purl.obolibrary.org/obo/NCBITaxon_10090", "label"=>"Mus musculus"}}
```

`Phenoscape::Ontotrace.ontotrace`

```ruby
require 'phenoscaperb'
onto = Phenoscape::Ontotrace
onto.ontotrace(taxon: "<http://purl.obolibrary.org/obo/VTO_0058051>", entity: "<http://purl.obolibrary.org/obo/BFO_0000050>", ret: "text")
#> => <?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<nexml xmlns=\"http://www.nexml.org/2009\" xmlns:dc=\"http://purl.org/dc/terms/\" xmlns:dwc=\"http://rs.tdwg.org/dwc/terms/\" xmlns:obo=\"http://purl.obolibrary.org/obo/\" xmlns:ps=\"http://vocab.phenoscape.org/\" xmlns:rdfs=\"http://www.w3.org/2000/01/rdf-schema#\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" version=\"0.9\" xsi:schemaLocation=\"http://www.nexml.org/2009 http://www.nexml.org/2009/nexml.xsd http://www.bioontologies.org/obd/schema/pheno http://purl.org/phenoscape/phenoxml.xsd\">\r\n  <meta xsi:type=\"LiteralMeta\" property=\"dc:creator\" />\r\n  <meta xsi:type=\"LiteralMeta\" property=\"dc:description\">Generated from the Phenoscape Knowledgebase on 2017-12-19 by Ontotrace query:\r\n* taxa: &lt;http://purl.obolibrary.org/obo/VTO_0058051&gt;\r\n* entities: &lt;http://purl.obolibrary.org/obo/BFO_0000050&gt;</meta>\r\n  <otus id=\"t4813128d-4f2b-417f-bf5a-d568dd584a64\" />\r\n  <characters id=\"c49fb5508-08a8-4252-93eb-50ac042eca46\" xsi:type=\"StandardCells\" otus=\"t4813128d-4f2b-417f-bf5a-d568dd584a64\">\r\n    <format />\r\n    <matrix />\r\n  </characters>\r\n  <trees id=\"t416da46f-0871-4c9a-ae39-43edbe473b6d\" otus=\"t4813128d-4f2b-417f-bf5a-d568dd584a64\" />\r\n</nexml>\r\n
```

## cli

cli options thus far

* `ph version`
* `ph taxon`
* `ph term`

For the `jq` command line tool see <https://stedolan.github.io/jq/>

```
ph taxon http://purl.obolibrary.org/obo/VTO_0067193 | jq .
```

```
{
  "rank": {
    "@id": "http://purl.obolibrary.org/obo/TAXRANK_0000006",
    "label": "species"
  },
  "label": "Apterichtus equatorialis",
  "extinct": false,
  "common_name": "Finless eel",
  "@id": "http://purl.obolibrary.org/obo/VTO_0067193"
}
```

## Meta

* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
* License: MIT

[Phenoscape]: http://kb.phenoscape.org
[phenoscapeapi]: http://kb.phenoscape.org/apidocs/#/
[changelog]: https://github.com/sckott/phenoscaperb/blob/master/CHANGELOG.md
