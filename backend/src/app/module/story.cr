module Story
  extend self

  def parse(dat : Array(Array(String))) : Array(String)
    return dat
      .shift
      .map{ |res|
        res.shift
      }
      .flatten
      .map{ |item|
        item
          .strip
          .select{ |item|
            item
          }
      }
      .map{ |item|
      }
  end

  def method_name
    # 各行を
    if test

    else

    end

    return {
      name:
      text:
      color:
      icon:
    }
  end

  def get_profile(name: String) :

  end

  def get_icon(code: String) : String

  end
end