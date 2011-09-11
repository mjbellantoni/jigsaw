require "httparty"

module Jigsaw

  class Request

    attr_accessor :response

    include ::HTTParty
    format :json

    SEARCH_COMPANY_URL = 'http://www.jigsaw.com/rest/searchCompany.json'

    def self.search_company(options = {})
      request = new(SEARCH_COMPANY_URL, options)
      request.parsed_response
    end

    def initialize(url, options)
      @response = self.class.get(url, :query => options)
    end

    def parsed_response
      @response.parsed_response
    end

  end

end