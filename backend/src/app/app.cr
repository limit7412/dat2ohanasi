require "json"
require "uri"
require "./../app/module/vip2ch"

class App
  def initialize(@id : String)
    @dat = Vip2ch.new @id
  end

  def get_ss
    story : Array(Array(String)) = @dat.parse
    return story
    # return JSON.parse(res.body)
  end
end