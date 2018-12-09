require "./../runtime/handler"
require "./../runtime/error_post"

def dat2ohanasi(event)
  begin
    response = event

    return {
      statusCode: 200,
      body: response
    }
  rescue ex
    ErrorPost.send_slack ex
  end
end

lambda_handler(dat2ohanasi)