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

  def test_term
    VCR.use_cassette("test_term") do
      tm = Phenoscape::Terms
      res = tm.term(iri: "http://purl.obolibrary.org/obo/UBERON_0011618")
      assert_equal(4, res.length)
      assert_equal(Hash, res.class)
      assert_equal('basihyal bone', res['label'])
    end
  end

  def test_term_search
    VCR.use_cassette("test_term_search") do
      tm = Phenoscape::Terms
      res = tm.search(text: "fin")
      assert_equal(1, res.length)
      assert_equal(100, res['results'].length)
      assert_equal(Hash, res.class)
    end
  end

  def test_term_label
    VCR.use_cassette("test_term_label") do
      tm = Phenoscape::Terms
      res = tm.label(iri: "http://purl.obolibrary.org/obo/UBERON_0011618")
      assert_equal(2, res.length)
      assert_equal(Hash, res.class)
      assert_match(/UBERON/, res['@id'])
      assert_equal('basihyal bone', res['label'])
    end
  end

end
