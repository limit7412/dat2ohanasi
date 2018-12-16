require "json"
require "slack"

class LambdaException < Exception
  def initialize(@message : String, @status_code : Int32)
  end

  def status_code
    @status_code
  end
end

module LambdaError
  extend self

  def send_slack(error, status_code = 500)
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

    return {
      status_code: status_code,
      body: error.message
    }
  end
end