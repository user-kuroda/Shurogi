﻿class SetsController < ApplicationController
  before_action :set_user, only: [:update]
  def index
    @user = User.find(session[:usr])
  end

  def update
      if params["firstpass"].present?
        if params["firstpass"] == @user[:pass]
          check
          return
        else
          @user.errors.add(:base, "パスワードが違います。")
          render :index
          return
        end
      else 
        params[:user][:pass] = @user.pass
        params[:user][:pass_confirmation] = @user.pass
        check
        return
      end
  end

  private
    
    def check
     if @user.update(user_params)
       redirect_to controller: :sets,action: :index
       logger.debug "kitarashii"
     else
       render :index
     end
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:userid, :name, :pass, :pass_confirmation, :mail, :mailback, :color, :call)
    end

end