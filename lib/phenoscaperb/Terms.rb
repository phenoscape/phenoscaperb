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
# Phenoscape::Terms
#
# Class to perform HTTP requests to the Phenoscape API
module Phenoscape
  module Terms
    ##
    # Return detail info for a given term. Currently this is the label and an optional definition.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] a taxon IRI
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.term(iri: "http://purl.obolibrary.org/obo/UBERON_0011618")
    def self.term(iri:, verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term", opts, verbose, options, nil).perform
    end

    # Search for terms in the KB by text match on a property value.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param string [String] the input text to search
    # @param type [String] the type of term to search for, e.g. http://www.w3.org/2002/07/owl#Class
    # @param property [String] relation between term and text
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.search(text: "fin")
    def self.search(text:, type: nil, property: nil, verbose: nil, options: nil)

      arguments = { text: text, type: type, property: property }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/search", opts, verbose, options, nil).perform
    end

    # Search for classes from a particular ontology.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param text [String] the input text to search
    # @param definedBy [String] the ontology identifier IRI in which the search terms are defined, e.g. http://purl.obolibrary.org/obo/uberon.owl
    # @param limit [integer] limit records
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.search_classes(text: "fin")
    def self.search_classes(text:, definedBy: nil, limit: nil, verbose: nil, options: nil)

      arguments = { text: text, definedBy: definedBy, limit: limit }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/search_classes", opts, verbose, options, nil).perform
    end

    # Retrieve a label for a given term IRI.
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] a taxon IRI
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.label(iri: "http://purl.obolibrary.org/obo/UBERON_0011618")
    def self.label(iri:, verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/label", opts, verbose, options, nil).perform
    end

    # Retrieve a label for each term IRI in a list
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iris [String] one or more taxon IRIs
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.labels(iris: [
    #        "http://purl.obolibrary.org/obo/UBERON_0011618"
    #      ])
    def self.labels(iris:, verbose: nil, options: nil)

      arguments = { iris: iris }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/labels", opts, verbose, options, nil).perform
    end

    # Return direct superclasses, direct subclasses, and equivalent classes of a given term
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] one or more taxon IRIs
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.classification(iri: "http://purl.obolibrary.org/obo/UBERON_0011618")
    def self.classification(iri:, verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/classification", opts, verbose, options, nil).perform
    end

    # Return all ancestor superclasses of a given term
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] one or more taxon IRIs
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.all_ancestors(iri: "http://purl.obolibrary.org/obo/UBERON_0011618")
    def self.all_ancestors(iri:, verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/all_ancestors", opts, verbose, options, nil).perform
    end

    # Return all descendant subclasses of a given term
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iri [String] one or more taxon IRIs
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.all_descendants(iri: "http://purl.obolibrary.org/obo/UBERON_0011618")
    def self.all_descendants(iri:, verbose: nil, options: nil)

      arguments = { iri: iri }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/all_descendants", opts, verbose, options, nil).perform
    end

    # Return all descendant subclasses of a given term
    #
    # @!macro phenoscape_params
    # @!macro phenoscape_options
    # @param iris [String] one or more taxon IRIs
    # @param definedBy [String] the ontology identifier IRI in which the search terms are defined, e.g. http://purl.obolibrary.org/obo/uberon.owl
    # @return [Hash] A hash
    #
    # @example
    #      require 'phenoscaperb'
    #
    #      tm = Phenoscape::Terms
    #      tm.least_common_subsumers(
    #         iris: "http://purl.obolibrary.org/obo/UBERON_0011618",
    #.        definedBy: ""     
    #      )
    def self.least_common_subsumers(iris:, definedBy:, verbose: nil, options: nil)

      arguments = { iris: iris, definedBy: definedBy }.tostrings
      opts = arguments.delete_if { |k, v| v.nil? }
      Request.new("term/least_common_subsumers", opts, verbose, options, nil).perform
    end
    
  end
end
