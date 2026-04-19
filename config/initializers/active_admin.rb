# frozen_string_literal: true

ActiveAdmin.setup do |config|
  config.site_title = "Easter Hunt"
  config.authentication_method = :authenticate_admin_devise!
  config.current_user_method = :current_admin_devise
  config.logout_link_path = :destroy_admin_devise_session_path
  config.batch_actions = true
  config.filter_attributes = [ :encrypted_password, :password, :password_confirmation ]
  config.localize_format = :long
end
