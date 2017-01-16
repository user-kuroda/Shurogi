class AllusersController < ApplicationController

	def index
		@users = User.all
	end
	 
	def show
		@user = User.find(params[:id])
        @user_name = @user.name
        @items = Item.where(user: params[:id]) 
    end

end

