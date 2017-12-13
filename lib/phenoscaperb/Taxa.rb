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
# Phenoscape::Taxa
#
# Class to perform HTTP requests to the Phenoscape API
module Phenoscape
  module Taxa
    ##
    # Return detail info for a given taxon. Currently this is the label, extinction status, and an optional rank.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] a taxon IRI
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tax = Phenoscape::Taxa
    #      tax.taxon(iri: "http://purl.obolibrary.org/obo/VTO_0067193")
    def self.taxon(iri:, verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("taxon", opts, verbose, options, nil).perform
    end

    # Retrieve all taxa with a given taxonomic rank, within the given super-taxon. Ranks are term IRIs from the taxonomic rank ontology such as order, family, genus, species.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param rank [String] a rank IRI
    # @param in_taxon [String] a taxon IRI
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tax = Phenoscape::Taxa
    #      tax.taxon_with_rank(rank: "http://purl.obolibrary.org/obo/TAXRANK_0000003", in_taxon: "http://purl.obolibrary.org/obo/VTO_0000009")
    def self.taxon_with_rank(rank:, in_taxon:, verbose: nil, options: nil)

      arguments = { rank: rank, in_taxon: in_taxon }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("taxon/with_rank", opts, verbose, options, nil).perform
    end
    
  end
end
