class Api::V1::Users::SessionsController < Devise::SessionsController
  
  # Override create to return json
  def create
    self.resource = warden.authenticate!(auth_options)
    render json: {token: JWTWrapper.encode({ user_id: resource.id })}
  end
end