require 'active_support/inflector'

module Jigsaw

  class CompanyBasic

    attr_accessor :company_id, :name, :address, :city, :state, :zip, :country, :active_contacts, :graveyarded

    def initialize(json_object)
      @company_id      = json_object['companyId']
      @name            = json_object['name']
      @address         = json_object['address']
      @city            = json_object['city']
      @state           = json_object['state']
      @zip             = json_object['zip']
      @country         = json_object['country']
      @active_contacts = json_object['activeContacts']
      @graveyarded     = json_object['graveyarded']
    end    


    def self.list(api_key, options, fetch_all=false)

      options[:token]     = api_key
      options[:page_size] = options[:page_size] || 50 # 50 is the default.
      options[:offset]    = options[:offset] || 0 # 0 is the default.

      # Camelize options
      camelized_options = {}
      options.each do |key, value|
        camelized_options[key.to_s.camelize(:lower)] = value
      end

      # Send one or more requests depending on the number of results, the
      # page size and the value of fetch_all
      companies = []
      total_hits = nil
      fetched_hits = 0
      offset = options[:offset]

      begin

        response = Request.search_company(camelized_options)

        total_hits = response['totalHits']
        fetched_hits += response['companies'].size

        companies << response['companies'].map do |result|
          self.new(result)
        end

        #Calculate the next offset.
        offset += options[:page_size]
        camelized_options[:offset] = offset

      end while fetch_all && (total_hits > offset)
            
      # Return the hits info and the list of companies
      [total_hits, fetched_hits, companies.flatten]

    end

  end

end