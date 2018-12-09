require "json"
require "http/client"

module ErrorPost
  extend self

  def send_slack(error)

    message : String = "エラーみたい…確認してみよっか"
    post = {
      fallback: message,
      pretext: "<@#{ENV["SLACK_ID"]}> #{message}",
      title: error.message,
      text: error.backtrace.join("\n"),
      color: "#EB4646",
      footer: "dat2ohanasi-backend",
    }
    body = {
      attachments: [post]
    }

    HTTP::Client.post "#{ENV["WEBHOOK_URL_IZUMI"]}", body: body.to_json
  end
end