module Story
  extend self

  def parse(dat : Array(Array(String))) : Array(Hash(Symbol, String))
    # datをssとしてパース
    ss : Array(String) = dat
      .map{ |res|
        # レスの投稿情報を排除
        res.shift
        res
      }
      .flatten
      .map{ |item|
        # スペースのみをブランクに変換
        item.strip
      }
      .select{ |item|
        # 空白行削除
        !item.blank?
      }

    # ssをフロントでおはなしメーカー風に表示出来るように加工して返却
    return ss
      .map{ |item|
        create_message item
      }
    end

  def create_message(line : String)
    # 返却用データ準備
    message = {} of Symbol => String

    # セリフか判定して分岐
    if line.includes?("「")
      text = line.split("「")
      message[:name] = text.shift
      message[:text] = "「" + text.join("「")
    else
      message[:text] = line
    end

    return message
  end

  # def get_profile(name: String) :

  # end

  # def get_icon(code: String) : String

  # end
end