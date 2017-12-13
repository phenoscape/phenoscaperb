require "phenoscaperb/version"
require "phenoscaperb/request"
require "phenoscaperb/Taxa"
require "phenoscaperb/Ontotrace"
require "phenoscaperb/Terms"

# @!macro phenoscape_params
#   @param verbose [Boolean] Print request headers to stdout. Default: false

# @!macro phenoscape_options
#   @param options [Hash] Hash of options for configuring the request, passed on to Faraday.new
#     - timeout [Fixnum] open/read timeout Integer in seconds
#     - open_timeout [Fixnum] read timeout Integer in seconds
#     - proxy [Hash] hash of proxy options
#       - uri [String] Proxy Server URI
#       - user [String] Proxy server username
#       - password [String] Proxy server password
#     - params_encoder [Hash] not sure what this is
#     - bind [Hash] A hash with host and port values
#     - boundary [String] of the boundary value
#     - oauth [Hash] A hash with OAuth details

##
# Phenoscape - The top level module for using methods to access the GBIF API

module Phenoscape
  extend Configuration

  define_setting :base_url, "http://kb.phenoscape.org/api"

end
