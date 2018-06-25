# frozen_string_literal: true

require_relative '../../services/api/client' # TODO: find a better way to import

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # POST /resource
  def create
    build_resource(sign_up_params)

    response = SaltedgeAPI.new.customers.post(
        'data' => { 'identifier' => resource.email }
    )

    res_json = to_json(response)

    resource.attributes = { secret: res_json['data']['secret'],
                            customer_id: res_json['data']['id'] }
    resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def to_json(json_string)
    return '' if json_string.empty?
    JSON.parse(json_string)
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:secret, :customer_id])
  end

end
