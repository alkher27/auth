class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
  #find that user that's stored in the session (current user)
  @current_user = User.find_by({"id" => session["user_id"] })
  end
end
