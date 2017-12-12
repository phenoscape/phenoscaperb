require "faraday"
require 'faraday_middleware'
require "multi_json"
require "phenoscaperb/error"
require "phenoscaperb/request"
require "phenoscaperb/constants"
require 'phenoscaperb/helpers/configuration'
require 'phenoscaperb/faraday'
require 'phenoscaperb/utils'

##
# Phenoscape::Ontotrace
#
# Module to perform HTTP requests to the Phenoscape Ontotrace API
module Phenoscape
  module Ontotrace
    ##
    # Generate matrix of inferred presence/absence associations for anatomical structures subsumed by the provided entity class expression, for any taxa within the provided taxon class expression. Returns a NeXML-format evolutionary character matrix.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param taxon [String] Taxonomic class expression in OWL Manchester syntax
    # @param entity [String] Anatomical class expression in OWL Manchester syntax
    # @param variable_only [boolean] whether to restrict the matrix to characters with both ‘present’ and ‘absent’ values in the matrix. default: true
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      onto = Phenoscape::Ontotrace
    #      onto.ontotrace(taxon: "http://purl.obolibrary.org/obo/VTO_0058051", entity: "http://purl.obolibrary.org/obo/BFO_0000050")
    #      onto.ontotrace(taxon: "http://purl.obolibrary.org/obo/VTO_0058051", entity: "http://purl.obolibrary.org/obo/BFO_0000050", variable_only: false)
    #.      
    #.     # this one times out
    #      # onto.ontotrace(taxon: "http://purl.obolibrary.org/obo/VTO_0033622", entity: "http://purl.obolibrary.org/obo/UBERON_0003097")
    def self.ontotrace(taxon:, entity:, variable_only: nil, verbose: nil, options: nil)

      arguments = { taxon: '<%s>' % taxon, entity: '<%s>' % entity, variable_only: variable_only }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("ontotrace", opts, verbose, options).perform
    end
    
  end
end
