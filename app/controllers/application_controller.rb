class ApplicationController < ActionController::Base

  include SessionsHelper
  helper_method :count_favorites
private

def require_user_logged_in
  unless logged_in?
    redirect_to login_url
  end
end

def counts(user)
  @count_microposts = user.microposts.count
  @count_followings = user.followings.count
  @count_followers = user.followers.count
end

def count_favorites
  Favorite.where(user_id: session[:user_id]).count
end

end