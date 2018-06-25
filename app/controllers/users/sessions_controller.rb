# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def news
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

end
