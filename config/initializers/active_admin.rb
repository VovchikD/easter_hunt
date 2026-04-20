# frozen_string_literal: true

ActiveAdmin.setup do |config|
  config.site_title = "Easter Hunt"
  config.authentication_method = :authenticate_system_admin!
  config.current_user_method = :current_system_admin
  config.logout_link_path = :destroy_system_admin_session_path
  config.batch_actions = true
  config.filter_attributes = [ :encrypted_password, :password, :password_confirmation ]
  config.localize_format = :long
end
