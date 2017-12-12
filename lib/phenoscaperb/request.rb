require "faraday"
require "multi_json"
require "phenoscaperb/error"
require "phenoscaperb/constants"
require 'phenoscaperb/utils'
require 'phenoscaperb/helpers/configuration'

##
# Phenoscape::Request
#
# Class to perform HTTP requests to the Phenoscape API
module Phenoscape
  class Request #:nodoc:

    attr_accessor :endpt
    attr_accessor :args
    attr_accessor :verbose
    attr_accessor :options

    def initialize(endpt, args, verbose, options)
      self.endpt = endpt
      self.args = args
      self.verbose = verbose
      self.options = options
    end

    def perform
      if verbose
        conn = Faraday.new(:url => Phenoscape.base_url, :request => self.options || []) do |f|
          f.response :logger
          f.use FaradayMiddleware::RaiseHttpException
          f.options.params_encoder = Faraday::FlatParamsEncoder
          f.adapter  Faraday.default_adapter
        end
      else
        conn = Faraday.new(:url => Phenoscape.base_url, :request => self.options || []) do |f|
          f.use FaradayMiddleware::RaiseHttpException
          f.options.params_encoder = Faraday::FlatParamsEncoder
          f.adapter  Faraday.default_adapter
        end
      end

      conn.headers[:user_agent] = make_ua
      conn.headers["X-USER-AGENT"] = make_ua

      res = conn.get self.endpt, self.args
      
      if !res.headers['content-type'].match(/json/).nil?
        out = MultiJson.load(res.body)
      else
        out = res.body
      end
      return out
    end

  end
end
