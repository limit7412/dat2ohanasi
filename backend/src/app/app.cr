require "json"
require "uri"

class App
  def initialize(@url : String)
    @uri = URI.parse @url
  end

  def get_data
    res = HTTP::Client.get "http://ex14.vip2ch.com/news4ssnip/dat/1505546603.dat"
    return res
  end
end