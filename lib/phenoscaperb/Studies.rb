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
# Phenoscape::Studies
#
# Class to perform HTTP requests to the Phenoscape API
module Phenoscape
  module Studies
    ##
    # Return studies containing taxa which are members of the optional input taxon expression and are have annotated phenotypes which are relevant to the optional input entity expression.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param taxon [String] Taxonomic class expression in OWL Manchester syntax
    # @param entity [String] Anatomical class expression in OWL Manchester syntax
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      st = Phenoscape::Studies
    #      st.query(taxon: "<http://purl.obolibrary.org/obo/VTO_0037519>", entity: "<http://purl.obolibrary.org/obo/UBERON_0001703>")
    def self.query(taxon:, entity:, verbose: nil, options: nil)

      arguments = { taxon: taxon, entity: entity }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("study/query", opts, verbose, options, nil).perform
    end

    # Taxa annotated within a study
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] the study IRI
    # @param limit [Integer] maximum results to return
    # @param offset [Integer] index of results to begin returning
    # @param total [boolean] whether to return the total result count rather than the results
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tax = Phenoscape::Studies
    #      st.taxa(iri: "http://www.pfeilbook.com/07pala/pdf/2_48d15.pdf")
    def self.taxa(iri:, limit: 20, offset: 0, total: false, verbose: nil, options: nil)

      arguments = { iri: iri, limit: limit, offset: offset, total: total }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("study/taxa", opts, verbose, options, nil).perform
    end

    # Character states and their phenotypes annotated within a study
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] the study IRI
    # @param limit [Integer] maximum results to return
    # @param offset [Integer] index of results to begin returning
    # @param total [boolean] whether to return the total result count rather than the results
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tax = Phenoscape::Studies
    #      st.phenotypes(iri: "http://www.pfeilbook.com/07pala/pdf/2_48d15.pdf")
    def self.phenotypes(iri:, limit: 20, offset: 0, total: false, verbose: nil, options: nil)

      arguments = { iri: iri, limit: limit, offset: offset, total: total }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("study/phenotypes", opts, verbose, options, nil).perform
    end

    # Return a data matrix in NeXML format containing the data for a given study.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] the study IRI
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tax = Phenoscape::Studies
    #      st.matrix(iri: "http://www.pfeilbook.com/07pala/pdf/2_48d15.pdf")
    def self.matrix(iri:, ret: "hash", verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("study/matrix", opts, verbose, options, ret, "text/plain").perform
    end
    
  end
end
