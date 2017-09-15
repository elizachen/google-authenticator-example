class UserMfaSessionsController < ApplicationController
  skip_before_filter :check_mfa

  def new
    @user = current_user
  end

  def create
    @user = current_user
    if @user.google_authentic?(params[:auth][:mfa_code])
      UserMfaSession.create(@user)
      redirect_to root_url
    else
      flash[:error] = "Wrong code"
      render :new
    end
  end
end
