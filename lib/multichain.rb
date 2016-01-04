require 'multichain/version'
require 'httparty'

module Multichain
  def self.headers
    {
      'Accept' => 'application/json'
    }
  end

  def self.md5 url, headers = self.headers
    body = Digest::MD5.hexdigest(HTTParty.get(url, headers: headers).body)
  end

  def self.input_string url, headers = self.headers
    a = []
    a.push Time.new.to_i
    a.push url
    a.push headers.to_json
    a.push md5(url)

    a.join '|'
  end
end
