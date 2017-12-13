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
# Phenoscape::Genes
#
# Class to perform HTTP requests to the Phenoscape API
module Phenoscape
  module Genes
    ##
    # Return detail info for a given gene
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] a gene IRI
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      ge = Phenoscape::Genes
    #      ge.gene(iri: "http://www.informatics.jax.org/marker/MGI:104842")
    def self.gene(iri:, verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("gene", opts, verbose, options).perform
    end

    # Search for genes by gene symbol.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param text [String] the input text to search
    # @param taxon [String] NCBI IRI for taxon
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      ge = Phenoscape::Genes
    #      ge.search(text: "fin")
    def self.search(text:, taxon: nil, verbose: nil, options: nil)

      arguments = { text: text, taxon: taxon }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("gene/search", opts, verbose, options).perform
    end

    # Search for classes from a particular ontology.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] anatomical entity IRI
    # @param quality [String] uality IRI
    # @param parts [boolean] whether to include phenotypes of parts of the entity. default: false
    # @param historical_homologs [boolean] whether to include historical homologs of the entity in the query. default: false
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      ge = Phenoscape::Genes
    #      ge.affecting_entity_phenotype(iri: "http://purl.obolibrary.org/obo/AEO_0001004")
    def self.affecting_entity_phenotype(iri:, quality: nil, parts: nil, historical_homologs: nil,
        serial_homologs: nil, limit: nil, offset: nil, total: nil, verbose: nil, options: nil)

      arguments = { iri: iri, quality: quality, parts: parts, 
        historical_homologs: historical_homologs, serial_homologs: serial_homologs, 
        limit: limit, offset: offset, total: total }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("gene/affecting_entity_phenotype", opts, verbose, options).perform
    end

  end
end
