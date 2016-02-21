class FavoritesController < ApplicationController
  def index

  end

  private

  def json_web_token
      JWT.encode auth_payload, hmac_secret, 'HS256'
  end
  helper_method :json_web_token

  def auth_payload
    {
      exp: 1.day.from_now.to_i, # https://tools.ietf.org/html/rfc7519#section-4.1.4
      iat: Time.now.to_i,       # https://tools.ietf.org/html/rfc7519#section-4.1.6
      user_id: current_user.id
    }
  end

  def hmac_secret
    Rails.application.secrets.json_web_token_key
  end
end
