require 'unirest'
require 'nokogiri'

response = Unirest.post "https://mullvad.net/en/account/", 
                        headers:{ "Accept" => "application/text" }, 
                        parameters:{ :create_account => "create" }

doc = Nokogiri::HTML.parse(response.body) # Unparsed body
puts "Your new trial account number: " + doc.search('input').first['value']