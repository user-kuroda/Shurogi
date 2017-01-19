class AllusersController < ApplicationController

	def index
		@users = User.all
	end
	 
	def show
		@user = User.find(params[:id])
        @user_name = @user.name
        @items = Item.where(user: params[:id]) 
    end

   # def search_user
   #    @e_users = params["search_user"]["userid"]
   #   @users = User.where(user: session[:usr]).where("userid like '%#{@s_users}%'")
   #   render :index
   # end
	def search_user
	   @users = User.where("userid like '%#{params["search_user"]["userid"]}%'")
	   @search_user = params["search_user"]["userid"]
	   render :index
    end

end

