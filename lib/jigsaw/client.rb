module Jigsaw
  class Client

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def company_search(options = {}, fetch_all = false)
      CompanyBasic.list(@api_key, options, fetch_all)
    end

  end
end