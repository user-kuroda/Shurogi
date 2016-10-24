class SetController < ApplicationController
  def index
    @user = User.find(session[:user])
  end
end
