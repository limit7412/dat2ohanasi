require "json"
require "uri"
require "./../app/module/vip2ch"

class App
  def initialize(@id : String)
    @ssvip = Vip2ch.new @id
  end

  def get_ss
    dat : Array(Array(String)) = @ssvip.get
    story = dat
    return story
    # return JSON.parse(res.body)
  end
end