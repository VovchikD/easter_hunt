RSpec.describe 'Api::V1::Admin::SessionsController', type: :request do
  include_examples 'authentication endpoint',
                   factory: :admin,
                   path: '/api/v1/admin/login',
                   email: 'admin@mail.com'
end
