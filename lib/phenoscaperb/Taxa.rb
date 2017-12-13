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

    # Retrieve taxa with annotated phenotypes related to the given anatomical entity or quality.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param entity [String] Anatomical class expression in OWL Manchester syntax
    # @param quality [String] Quality class expression in OWL Manchester syntax
    # @param in_taxon [String] A taxon group to limit the results
    # @param parts [boolean] whether to include phenotypes of parts of the entity. default: false
    # @param historical_homologs [boolean] whether to include historical homologs of the entity in the query. default: false
    # @param serial_homologs [boolean] whether to include serial homologs of the entity in the query. default: false
    # @param total [boolean] whether to return the total result count rather than the results. default: false
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tax = Phenoscape::Taxa
    #      # tax.with_phenotype
    def self.with_phenotype(entity: nil, quality: nil, in_taxon: nil, parts: false, historical_homologs: false,
        serial_homologs: false, limit: 20, offset: 0, total: false, verbose: nil, options: nil)

      arguments = { entity: entity, quality: quality, in_taxon: in_taxon, parts: parts, 
        historical_homologs: historical_homologs, serial_homologs: serial_homologs, 
        limit: limit, offset: offset, total: total }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("taxon/with_phenotype", opts, verbose, options, nil).perform
    end

    # Retrieve taxa annotations
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param entity [String] Anatomical class expression
    # @param quality [String] Quality class expression
    # @param in_taxon [String] A taxon group to limit the results
    # @param parts [boolean] whether to include phenotypes of parts of the entity. default: false
    # @param historical_homologs [boolean] whether to include historical homologs of the entity in the query. default: false
    # @param serial_homologs [boolean] whether to include serial homologs of the entity in the query. default: false
    # @param total [boolean] whether to return the total result count rather than the results. default: false
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tax = Phenoscape::Taxa
    #      tax.annotations(entity: "http://purl.obolibrary.org/obo/UBERON_0001703", quality: "http://purl.obolibrary.org/obo/PATO_0000052", in_taxon: "http://purl.obolibrary.org/obo/VTO_0037519", parts: true, historical_homologs: false, serial_homologs: false, limit: 20, offset: 0, total: true)
    def self.annotations(entity: nil, quality: nil, in_taxon: nil, parts: false, historical_homologs: false,
        serial_homologs: false, limit: 20, offset: 0, total: false, verbose: nil, options: nil)

      arguments = { entity: entity, quality: quality, in_taxon: in_taxon, parts: parts, 
        historical_homologs: historical_homologs, serial_homologs: serial_homologs, 
        limit: limit, offset: offset, total: total }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("taxon/annotations", opts, verbose, options, nil).perform
    end
    
  end
end
