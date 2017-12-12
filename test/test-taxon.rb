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

end
