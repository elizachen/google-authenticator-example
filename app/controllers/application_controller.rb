class ApplicationController < ActionController::Base
  before_filter :check_mfa

  def current_user
    @current_user = User.find_or_create_by(name: 'elizachen', email: 'elizachen34@gmail.com')
  end

  private
  def check_mfa
     if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
      redirect_to new_user_mfa_session_url
    end
  end
end
