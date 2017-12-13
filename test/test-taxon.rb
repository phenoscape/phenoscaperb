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

class TestWorks < Test::Unit::TestCase

  def test_taxon
    VCR.use_cassette("test_taxon") do
      tax = Phenoscape::Taxa
      res = tax.taxon(iri: "http://purl.obolibrary.org/obo/VTO_0067193")
      assert_equal(5, res.length)
      assert_equal(Hash, res.class)
      assert_equal(Hash, res['rank'].class)
    end
  end

  def text_taxon_annotations
    VCR.use_cassette("text_taxon_annotations") do
      tax = Phenoscape::Taxa
      res = tax.annotations(entity: "http://purl.obolibrary.org/obo/UBERON_0001703", quality: "http://purl.obolibrary.org/obo/PATO_0000052", in_taxon: "http://purl.obolibrary.org/obo/VTO_0037519", parts: true, historical_homologs: false, serial_homologs: false, limit: 20, offset: 0, total: true)
      assert_equal(1, res.length)
      assert_equal(Hash, res.class)
      assert_equal('total', res.keys[0])
    end
  end

end
