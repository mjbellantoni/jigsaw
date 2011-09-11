require "spec_helper"

describe Jigsaw::Request do

  include CompanySearchWebmockHelpers

  context 'Listing companies' do

    before(:each) do
      stub_jigsaw_for_request
    end

    it 'should retrieve a list of companies' do
      response = Jigsaw::Request.search_company(:token => api_key)
      response['companies'].should_not be_empty
    end

    it 'should retrieve the number of matching companies' do
      response = Jigsaw::Request.search_company(:token => api_key)
      response['totalHits'].should_not be_nil
    end
  end

end