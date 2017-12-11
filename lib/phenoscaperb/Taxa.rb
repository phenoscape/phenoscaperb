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
# Class to perform HTTP requests to the phenoscape API
# @!macro phenoscape_params
#   @param offset [Fixnum] Number of record to start at, any non-negative integer. Default: 0
#   @param limit [Fixnum] Number of results to return. Default: 100
#   @param verbose [Boolean] Print request headers to stdout. Default: false
module Phenoscape
  module Taxa
    ##
    # Return detail info for a given taxon. Currently this is the label, extinction status, and an optional rank.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param name [String] a taxon IRI
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
      Request.new("taxon", opts, verbose, options).perform
    end

  end
end
