class SetController < ApplicationController
  def index
    @user = User.find(session[:usr])
  end

  def update
    respond_to do |format|
      if current_user.update_with_password(user_params)
        # パスワードを変更するとログアウトしてしまうので、再ログインが必要
       sign_in(current_user, bypass: true)
        format.html { redirect_to edit_setting_path }
      else
        format.html { render :edit }
    end
  end

current_user.update_with_password(
  password: "new_password",
  password_confirmation: "new_password",
  current_password: "old_password"
)

end
