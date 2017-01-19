class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :color]
  skip_before_action :check_logined
  before_action :auth_master, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @user = User.find(session[:usr])
    @user_name = @user.name
    @items = Item.where(user: session[:usr]) 
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: false 
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to color_user_path(@user) }
        format.json { redirect_to color_user_path(@user), status: :created, location: @user }
      else
        format.html { render :new ,layout: false}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to controller: :login,action: :index }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :color  }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def color
    render layout: false 
  end

  def auth_master
    name = 'team_shurogi'
    password = 'shurogi'
    authenticate_or_request_with_http_basic('Shurogi') do |n,p|
      n == name && p == password
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      #@user = User.find(session[:usr])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:userid, :name, :pass, :pass_confirmation, :mail, :mailback, :color, :call)
    end
end
