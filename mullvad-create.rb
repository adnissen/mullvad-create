require 'unirest'

response = Unirest.post "https://mullvad.net/en/account/", 
                        headers:{ "Accept" => "application/text" }, 
                        parameters:{ :create_account => "create" }

puts response.raw_body # Unparsed body