RSpec.describe 'Api::V1::Hunter::SessionsController', type: :request do
  include_examples 'authentication endpoint',
                   factory: :hunter,
                   path: '/api/v1/hunter/login',
                   email: 'hunter@mail.com'
end
