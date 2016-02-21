class ApiController < ActionController::Base
  before_action :verify_jwt_token!

  def current_user
    @current_user ||= User.find(jwt_payload["user_id"])
  end


  private

  def verify_jwt_token!
    jwt_payload
  rescue JWT::VerificationError, # signature doesnt match (token changed or wrong secret)
    JWT::DecodeError # bad token - empty, not enough segments, not base64 encoded
    head :unauthorized
  end

  def jwt_payload
    @jwt_payload ||=
      begin
        payload,header = decoder.call(raw_jwt_token)
        payload
      end
  end

  def raw_jwt_token
    bearer, token = request.headers["Authorization"].to_s.split(' ', 2)
    token = "" unless bearer == "Bearer"
    token
  end

  def decoder
    @decoder ||=
      begin
        options = {
          algorith: "HS256",
          verify_expiration: true, # might want to disable in dev
        }

        ->(raw){
          JWT.decode(raw,
                     Rails.application.secrets.json_web_token_key,
                     true, # verify the signature
                     options)
        }
      end
  end
end
