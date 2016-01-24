class HomeController < ApplicationController
  def index
    render :json => {:message => "Refer docs/apis for api information"}
  end
end
