require "json"
require "uri"
require "./dat"

class Vip2ch
  def initialize(@id : String)
    @url = "http://ex14.vip2ch.com/news4ssnip/dat/#{@id}.dat"
    @uri = URI.parse @url
  end

  def get : Array(Array(String))
    # Lambda上で明示的にクライアント証明書を示す必要がある
    ssl = OpenSSL::SSL::Context::Client.new
    ssl.ca_certificates = "/etc/pki/tls/cert.pem"

    # 文字コード変換を別のLambdaで
    res = HTTP::Client.get("#{ENV["ENCODING_URL"]}?url=#{@url}",
      tls: ssl
    )

    return Dat.parse res.body
  end
end