class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def render_400(msg = "Invalid Request.", resp = {})
    resp['error'] = msg
    render :json => resp, :status => 400
  end

  def render_401(msg="Unauthorized.",resp={})
    resp["error"] = msg
    render :json => resp, :status => 401
  end

  def render_403(msg="Forbidden.", resp = {})
    resp["error"] = msg
    render :json => resp, :status => 403
  end

  def render_404(msg="Not found.", resp = {})
    resp["error"] = msg
    render :json => resp, :status => 404
  end

  def override_session_if_token
    @token = params["token"] || params["auth_token"] || params["access_token"]
    if @token
      #current-user's token matches params[:token] then he is signed-in nothing to do here
      if current_user
        if (current_user.authentication_token == @token)
          return true
        else
          #params[:token] doesn't match that of current_user
          #logout current_user and sign-in that user who owns token
          sign_out(current_user)
        end
      end

      user = User.find_by_authentication_token(@token)
      unless user
        render_401("Invalid authentication token") and return false
        return false
      end
      Rails.logger.info("ApplicationController: New login #{user.name}")
      sign_in(user)
    elsif current_user
      @token = current_user.authentication_token
    elsif (not current_user)
      render_401
      return false
    end
    return true
  end

end
