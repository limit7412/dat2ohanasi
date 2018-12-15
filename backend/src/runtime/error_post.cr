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
      color: "#EB4646",
      footer: "dat2ohanasi-backend",
    }
    attachments = [
      JSON.parse(post.to_json)
    ]

    slack : Slack::Message = Slack::Message.new(
      text: error.backtrace.join("\n"),
      attachments: attachments
    )
    slack.send_to_hook "#{ENV["WEBHOOK_URL_IZUMI"]}"

    return {
      status_code: status_code,
      body: error.message
    }
  end
end