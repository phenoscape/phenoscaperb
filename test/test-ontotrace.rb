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

  def test_ontotrace
    VCR.use_cassette("test_ontotrace") do
      onto = Phenoscape::Ontotrace
      res = onto.ontotrace(taxon: "<http://purl.obolibrary.org/obo/VTO_0058051>", entity: "<http://purl.obolibrary.org/obo/BFO_0000050>")
      assert_equal(2, res.length)
      assert_equal(Hash, res.class)
    end
  end

end
