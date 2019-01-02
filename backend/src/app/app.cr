require "json"
require "uri"
require "./../app/module/vip2ch"

class App
  def initialize(@id : String)
    @dat = Vip2ch.new @id
  end

  def get_data
    story = @dat.get_dat
    return story
    # return JSON.parse(res.body)
  end
end