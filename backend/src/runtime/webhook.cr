require "json"
require "uri"
require "openssl"

class WebHook
  def initialize(@url : String)
  end

  def post(body)
    ssl = OpenSSL::SSL::Context::Client.new
    # Lambda上で動かないので一旦クライアント証明書は無視
    ssl.verify_mode = OpenSSL::SSL::VerifyMode::NONE

    uri = URI.parse @url
    client : HTTP::Client = HTTP::Client.new(uri,
      tls: ssl
    )
    client.post @url, body: body.to_json
  end
end