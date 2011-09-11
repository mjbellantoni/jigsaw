require "spec_helper"



describe Jigsaw::CompanyBasic do

  include CompanySearchWebmockHelpers

  context "with 9 hits and 5 hits per page" do
    
    before(:each) do
      stub_jigsaw_for_page_test
      @options = { :page_size => 5 }
    end

    context "when 'fetch_all' is true" do
      before(:each) do
        @total_hits, @fetched_hits, @companies = Jigsaw::CompanyBasic.list(api_key, @options, true)
      end

      it "finds 9 hits" do
        @total_hits.should == 9
      end

      it "fetches 9 hits" do
        @fetched_hits.should == 9
      end

      it "returns 9 companies" do
        @companies.should have(9).items
      end
    end

    context "when 'fetch_all' is false" do
      before(:each) do
        @total_hits, @fetched_hits, @companies = Jigsaw::CompanyBasic.list(api_key, @options, false)
      end

      it "finds 9 hits" do
        @total_hits.should == 9
      end

      it "fetches 5 hits" do
        @fetched_hits.should == 5
      end

      it "returns 5 companies" do
        @companies.should have(5).items
      end
    end

  end

end