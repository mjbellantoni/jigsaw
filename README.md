# Jigsaw

This gem provides a Ruby wrapper around the Jigsaw API, using HTTParty.  Currently, only Company Search is supported.


## Obtaining an API key

To be able to use this gem, you'll need a Jigsaw Developer API key. To request an API key, point your browser to
http://developer.jigsaw.com/member/register and follow the instructions there.


## Installing the gem

To use this gem, install it with <tt>gem install jigsaw</tt> or add it to your Gemfile:

    gem 'jigsaw'

And install it with <tt>bundle install</tt>


## Usage

### Retrieving a list of companies

You can search for companies and you'll receive an array of JigSaw::CompanyBasic objects 
in return.  These contain some, but not all of the information associated with a company.

Searches are refined using these arguments.

* *updated_since*: The format is yyyy-MM-dd, for example 2008-10-31
* *name*:Oracle, IBM, www.jigsaw.com , AAPL
* *country*: Country name.  See developer documentation for details.
* *state*: Two letter state name abbreviations.  See developer documentation for details.
* *metro_area*: Major metropolitan areas by name.  See developer documentation for details.
* *area_code*: The digit area code.
* *zip_code*: Five or nine digit zip code.
* *industry*: Industry value. See developer documentation for details.
* *sub_industry*: Sub-industry value. See developer documentation for details.
* *employees*: Employee size range.  See developer documentation for details.
* *revenue*: Company revenue range.  See developer documentation for details.
* *ownership*: public, private, government, other
* *website_type*: .com, .gov, .org, .biz, .info, .net, .edu, .mil
* *fortune_rank*: 500, 1000
* *include_graveyard*: Is this company dead? false (default), true
* *order*: ASC, DESC, the default is no order
* *order_by*: Company, City, State, updatedSince
* *offset*: The start point for records that are returned.
* *page_size*: The number of records that are returned per page. Default 50. Maximum 100.

Details for argument values can be found in the [Data Keys and Values section](http://developer.jigsaw.com/documentation/search_and_get_api_guide/6_Data_Keys_and_Values) of
the developer documentation.

First register a new Client:

    @client = Jigsaw::Client.new(API_KEY)

Then retrieve a list of companies in zip code "02478":

    @client.company_search({:zip_code => "02478"})

Search by zip code and return a single page of 10 results:

    @client.company_search({:zip_code => "02478", :page_size => 10, :offset => 0})

Search by zip code and return all results:

    @client.company_search({:zip_code => "02478"}, true)

Search by zip code *and* return all results:

    @client.company_search({:zip_code => "02478", :ownership => "private"}, true)

### Retrieving company details

Not yet implemented.

### Retrieving a list of contacts

Not yet implemented.

### Retrieving contact details

Not yet implemented.

## To Do
* Add lookup of detailed company info. (Planned for 0.2.0)
* Handle errors at the Request level. (Planned for ???)
* The rest of the API! (Planned for ???)

## Acknowledgement

This gem is patterned after Marcel de Graaf's [google_pages gem](https://github.com/marceldegraaf/google_places).

## Contributing to jigsaw

You're very welcome to add functionality to this gem. To do so, follow these steps:

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Matthew Bellantoni. See LICENSE.txt for
further details.

