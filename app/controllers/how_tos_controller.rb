class HowTosController < ApplicationController
  before_action :set_how_to, only: [:show, :edit, :update, :destroy]

  # GET /how_tos
  # GET /how_tos.json
  def index
    @how_tos = HowTo.all
  end

  # GET /how_tos/1
  # GET /how_tos/1.json
  def show
  end


  # GET /how_tos/new
  def new
    @how_to = HowTo.new
  end

  # GET /how_tos/1/edit
  def edit
  end

  # POST /how_tos
  # POST /how_tos.json
  def create
    @how_to = HowTo.new(how_to_params)

    respond_to do |format|
      if @how_to.save
        format.html { redirect_to @how_to, notice: 'How to was successfully created.' }
        format.json { render :show, status: :created, location: @how_to }
      else
        format.html { render :new }
        format.json { render json: @how_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /how_tos/1
  # PATCH/PUT /how_tos/1.json
  def update
    respond_to do |format|
      if @how_to.update(how_to_params)
        format.html { redirect_to item_path }
        format.json { render :show, status: :ok, location: @items }
      else
        format.html { render :edit }
        format.json { render json: @how_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /how_tos/1
  # DELETE /how_tos/1.json
  def destroy
    @how_to.destroy
    respond_to do |format|
      format.html { redirect_to how_tos_url, notice: 'How to was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upcount
    User.find(session[:usr]).update(count: 1)
    redirect_to users_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_how_to
      @how_to = HowTo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def how_to_params
     params.require(:how_to).permit(:htimg1,:htimg2,:htimg3)
    end
end
