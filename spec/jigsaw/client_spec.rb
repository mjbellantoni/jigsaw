require 'spec_helper'

describe Jigsaw::Client do

  include CompanySearchWebmockHelpers

  it "should not initialize without an api_key" do
    lambda { Jigsaw::Client.new }.should raise_error
  end

  it "should initialize with an api_key" do
    @client = Jigsaw::Client.new(api_key)
    @client.api_key.should == api_key
  end


  context "a company search" do
    
    before(:each) do
      stub_jigsaw_for_client_company_search
      @client = Jigsaw::Client.new(api_key)
      @total_hits, @fetched_hits, @companies = @client.company_search({:zip_code => "02478"}, false)      
    end

    it "tells how many hits it found " do
      @total_hits.should == 3
    end

    it "tells how many hits it returns " do
      @fetched_hits.should == 3
    end

    it "returns those hits " do
      @companies.should have(3).items
    end

  end

end
