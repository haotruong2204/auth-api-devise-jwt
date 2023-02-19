# frozen_string_literal: true

class Administrators::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with resource, _options = {}
    if resource.persisted?
      render json: { data: { code: 200, message: "Signed up successfully", data: resource } }, status: :ok
    else
      render json: {
        data: { message: "Admin could not be created successfully", errors: resource.errors.full_messages },
        status: :unprocessable_entity
      }
    end
  end
end
