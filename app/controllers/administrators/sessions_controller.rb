# frozen_string_literal: true

class Administrators::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with resource, _options = {}
    if resource.persisted?
      render json: { data: { code: 200, message: "Admin signed in successfully", data: current_user }, status: :ok }
    else
      render json: {
        data: { message: "Admin could not be created successfully", errors: resource.errors.full_messages },
        status: :unprocessable_entity
      }
    end
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers["Authorization"].split[1],
      Rails.application.credentials.fetch(:secret_key_base)).first

    current_administrator = Administrator.find(jwt_payload["sub"])
    if current_administrator
      render json: { code: 200, message: "Signed out successfully" }, status: :ok
    else
      render json: { code: 401, message: "Admin has no active session" }, status: :ok
    end
  end
end
