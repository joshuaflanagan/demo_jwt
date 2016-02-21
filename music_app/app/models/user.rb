# No need for a database-backed model. The user records are all stored
# in the main_app database.
class User
  attr_reader :id

  def initialize(id)
    @id = id.to_i
  end

  # Make it look like an ActiveRecord model for now
  def self.find(id)
    new(id)
  end


  # Convenience method to build a valid token via rails console
  def dev_jwt_token
    JWT.encode(
      {user_id: id},
      Rails.application.secrets.json_web_token_key,
      'HS256'
    )
  end
end
