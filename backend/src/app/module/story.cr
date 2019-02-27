module Story
  extend self

  def parse(dat : Array(Array(String))) : Array(String)
    # datを一度配列なスレデータにパース
    thread : Array(Array(String)) = dat
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
    # スレをssのデータとして
    ss : Array(String) =  thread
      .map{ |item|
        item.delete_at(0)
      }
      .flatten
      .map{ |item|
        # TODO: 空白のみの行を削除
      }

    # ssをフロントでおはなしメーカー風に表示出来るように加工して返却
    return ss
      .map{ |item|
        create_message item
      }
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

    # TODO: 「」があるかで処理分岐が必要
    if line
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