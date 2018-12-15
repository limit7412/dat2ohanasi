require "./../runtime/handler"
require "./../runtime/error_post"

def dat2ohanasi(event)
  begin
    raise LambdaException.new("死にました", 404)
    response = event

    return {
      status_code: 200,
      body: response
    }
  rescue ex : LambdaException
    LambdaError.send_slack ex, ex.status_code
  rescue ex
    LambdaError.send_slack ex
  end
end

lambda_handler(dat2ohanasi)