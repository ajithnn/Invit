class V1::Api::UserController < ApplicationController
  
  before_filter :override_session_if_token

  resource_description do
      short 'Site Admin'
  end

end
