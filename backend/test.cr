require "slack"

message : String = "エラーみたい…確認してみよっか"
post = {
  fallback: message,
  pretext: "{message}",
  title: "error.message",
  color: "#EB4646",
  footer: "dat2ohanasi-backend",
}
attachments = [
  JSON.parse(post.to_json)
]

# slack : Slack::Message = Slack::Message.new(
#   text: "error",
#   attachments: attachments
# )
slack : Slack::Message = Slack::Message.new(
  text: "error",
  attachments: [
    {
      fallback: message,
      pretext: "{message}",
      title: "error.message",
      color: "#EB4646",
      footer: "dat2ohanasi-backend",
    }
  ]
)

slack.send_to_hook "https://hooks.slack.com/services/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"