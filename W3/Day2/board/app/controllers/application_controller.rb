class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception


def current_user
  if session[:user_id].nil?
    nil
  else
    User.find(session[:user_id])
  end
end

#만약 로그인하지 않았으면 로그인페이지로 가버려
def authorize
  if current_user.nil?
    flash[:alert] ="로그인을 해야 글을 쓸 수 있어!"
    redirect_to '/user/login'
  end
end


  helper_method :current_user
end
