require 'unirest'
require 'nokogiri'

class Mullvad
  def self.run
    response = Unirest.post "https://mullvad.net/en/account/", 
                            headers:{ "Accept" => "application/text" }, 
                            parameters:{ :create_account => "create" }

    doc = Nokogiri::HTML.parse(response.body) # Unparsed body
    "Your new trial account number: " + doc.search('input').first['value']
  end
end