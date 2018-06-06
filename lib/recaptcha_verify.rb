module RecaptchaVerify
  def verify_recaptcha(user_response)
    require 'uri'
    require 'net/http'
    require 'openssl'
   
   #status = `curl “https://www.google.com/recaptcha/api/siteverify"?secret=#{secret_key}&response=#{response}”` 
    recaptcha_url = "https://www.google.com/recaptcha/api/siteverify"
    remoteip = request.remote_ip
    uri = URI(recaptcha_url)
    options = { 
      :secret => ENV["SECRET_KEY_CAPTCHA"], 
      :remoteip => request.env["REMOTE_ADDR"], 
      :response => user_response 
    }
    response = Net::HTTP.post_form(URI.parse(recaptcha_url), options)
    #puts("Body: #{response.body}")

    #then parse the json response in the above 'response' variable and check whether
    #the API returns a success or failure and return true or false depending on it
    #logger.info "------status ==> #{response.body}"
    hash = JSON.parse(response.body)
    hash["success"] == true ? true : false
    # Posibles mensajes de error.
    # missing-input-secret  The secret parameter is missing.
    # invalid-input-secret  The secret parameter is invalid or malformed.
    # missing-input-response  The response parameter is missing.
    # invalid-input-response  The response parameter is invalid or malformed.
  end
end