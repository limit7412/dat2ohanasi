module Story
  extend self

  def parse(dat : Array(Array(String))) : Array(String)
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
      # .map{ |item|
      #   create_message item
      # }
    end

  def create_message(line : String)
    # 返却用データ準備
    message = {
      name: String.new,
      idol_id: String.new,
      text: String.new,
      color: String.new,
      icon_url: String.new,
    }

    # セリフか判定して分岐
    if line.include?("「")
      # TODO: 名前からidを取得できるか
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