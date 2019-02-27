module Dat
  extend self

  def parse(dat : String) : Array(Array(String))
    return dat
      .gsub("\\n", "")
      .gsub("<>", "")
      .split("</b>")
      .map{ |res|
        res.split("<br>")
      }
  end
end