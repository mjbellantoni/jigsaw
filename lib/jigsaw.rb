require 'httparty'

%w(client request company_basic).each do |file|
  require File.join(File.dirname(__FILE__), 'jigsaw', file)
end