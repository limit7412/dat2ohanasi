require "json"
require "uri"
require "./module/vip2ch"
require "./module/story"

class App
  def initialize(@id : String)
    @ssvip = Vip2ch.new @id
  end

  def get_ss
    dat : Array(Array(String)) = @ssvip.get
    story : Array(Hash(Symbol, String)) = Story.parse dat
    return story
  end
end