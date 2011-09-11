require 'active_support/json'


module CompanySearchWebmockHelpers

  BASIC_COMPANIES = [
    {
      "zip" => "02142-1108",
      "address" => "500 Kendall St",
      "name" => "Genzyme Corporation",
      "activeContacts" => 3514,
      "state" => "MA",
      "companyId" => 211909,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1453",
      "address" => "14 Cambridge Ctr",
      "name" => "Biogen Idec Inc.",
      "activeContacts" => 1991,
      "state" => "MA",
      "companyId" => 213499,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1100",
      "address" => "1 Broadway",
      "name" => "Patni Americas, Inc.",
      "activeContacts" => 867,
      "state" => "MA",
      "companyId" => 50666,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1413",
      "address" => "8 Cambridge Ctr",
      "name" => "Akamai Technologies, Inc.",
      "activeContacts" => 535,
      "state" => "MA",
      "companyId" => 36097,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1519",
      "address" => "101 Main St",
      "name" => "Pegasystems Inc.",
      "activeContacts" => 517,
      "state" => "MA",
      "companyId" => 42602,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1519",
      "address" => "101 Main St",
      "name" => "Endeca Technologies, Inc.",
      "activeContacts" => 230,
      "state" => "MA",
      "companyId" => 143901,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1531",
      "address" => "1 Main St",
      "name" => "Art Technology Group, Inc. (ATG Group)",
      "activeContacts" => 200,
      "state" => "MA",
      "companyId" => 90312,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1313",
      "address" => "1 Memorial Dr",
      "name" => "InterSystems Corp.",
      "activeContacts" => 190,
      "state" => "MA",
      "companyId" => 24687,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1605",
      "address" => "1 Cambridge Ctr",
      "name" => "Brightcove, Inc.",
      "activeContacts" => 144,
      "state" => "MA",
      "companyId" => 65820,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"},
    {
      "zip" => "02142-1401",
      "address" => "9 Cambridge Ctr",
      "name" => "Whitehead Institute for Biomedical Research",
      "activeContacts" => 129,
      "state" => "MA",
      "companyId" => 68825,
      "graveyarded" => false,
      "city" => "Cambridge",
      "country" => "United States"} ]


  def stub_jigsaw_for_request
    stub_request(:get, "http://www.jigsaw.com/rest/searchCompany.json?token=abc123").to_return(
        :status => 200,
        :body => ActiveSupport::JSON.encode({"totalHits" => BASIC_COMPANIES.size, "companies" => BASIC_COMPANIES }),
        :headers => { :content_type => 'application/json' })
  end

  def stub_jigsaw_for_page_test
    # 9 hits, return the first 5
    stub_request(:get, "http://www.jigsaw.com/rest/searchCompany.json?offset=0&pageSize=5&token=abc123").to_return(
        :status => 200,
        :body => ActiveSupport::JSON.encode({"totalHits" => 9, "companies" => BASIC_COMPANIES[0..4] }),
        :headers => { :content_type => 'application/json' })

    # 9 hits, return the last 4
    stub_request(:get, "http://www.jigsaw.com/rest/searchCompany.json?offset=5&pageSize=5&token=abc123").to_return(
        :status => 200,
        :body => ActiveSupport::JSON.encode({"totalHits" => 9, "companies" => BASIC_COMPANIES[5..8] }),
        :headers => { :content_type => 'application/json' })
    puts "SIZES: #{BASIC_COMPANIES[0..4].size} #{BASIC_COMPANIES[5..8].size}"
  end

end