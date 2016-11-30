class SetsController < ApplicationController
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

  def userdelete
    Item.where(user: session[:usr]).delete_all
    Category.where(user: session[:usr]).delete_all
    User.destroy(session[:usr])

    respond_to do |format| 
      format.html { redirect_to  users_url, notice: 'アカウントを削除しました' } 
      format.json { head :no_content } 
    end 
  end 



  private
    
    def check
     if @user.update(user_params)
       redirect_to controller: :sets,action: :index
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
