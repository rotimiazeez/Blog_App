class RegistrationsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json
end
