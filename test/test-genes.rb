require 'simplecov'
SimpleCov.start
if ENV['CI']=='true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require "phenoscaperb"
require 'fileutils'
require "test/unit"
require "json"
require_relative "test-helper"

class TestGenes < Test::Unit::TestCase

  def test_gene
    VCR.use_cassette("test_gene") do
      ge = Phenoscape::Genes
      res = ge.gene(iri: "http://www.informatics.jax.org/marker/MGI:104842")
      assert_equal(3, res.length)
      assert_equal(Hash, res.class)
      assert_equal('Coil', res['label'])
    end
  end

  def test_gene_search
    VCR.use_cassette("test_gene_search") do
      ge = Phenoscape::Genes
      res = ge.search(text: "coil")
      assert_equal(1, res.length)
      assert_equal(2, res['results'].length)
      assert_equal(Hash, res.class)
      assert_equal(Array, res['results'].class)
      assert_equal(Hash, res['results'][0].class)
    end
  end

  def test_gene_affecting_entity_phenotype
    VCR.use_cassette("test_gene_affecting_entity_phenotype") do
      ge = Phenoscape::Genes
      res = ge.affecting_entity_phenotype(iri: "http://purl.obolibrary.org/obo/UBERON_0003097")
      assert_equal(1, res.length)
      assert_equal(Hash, res.class)
      assert_equal(Array, res['results'].class)
      assert_equal(Hash, res['results'][0].class)
      assert_match('http', res['results'][0]['@id'])
    end
  end

end
