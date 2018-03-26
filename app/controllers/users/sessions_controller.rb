# frozen_string_literal: true

require_relative '../../services/api/client' #TODO find a better way to import

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def news
    super
  end

  # POST /resource/sign_in
  def create
    api = SaltedgeAPI.new
    puts(api.customers.get)

    # super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
