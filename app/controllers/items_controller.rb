class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(user: session[:usr]) 
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  def show_image

    # send_dataはバイナリファイルをブラウザに表示するため
    # http://railsdoc.com/references/send_data

    @item = Item.find(params[:id])
      send_data @item.image, :type => 'image/jpeg', :disposition => 'inline'
  end
  def show_image2
    @item = Item.find(params[:id])
    send_data @item.image2, :type => 'image/jpeg', :disposition => 'inline'
  end
  def show_image3
    @item = Item.find(params[:id])
    send_data @item.image3, :type => 'image/jpeg', :disposition => 'inline'
  end


  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = session[:usr]
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      return_params = params.require(:item).permit(:itemname, :itemcall, :situ, :ani, :day, :category, :fav, :user_id,:tag_list,:image,:image2,:image3) 
      a = []
      a << return_params[:image].read if return_params[:image] != nil
      a << return_params[:image2].read if return_params[:image2] != nil
      a << return_params[:image3].read if return_params[:image3] != nil
      logger.debug a.length
      return_params[:image] = a[0] if a.length >= 1
      return_params[:image2] = a[1] if a.length >= 2
      return_params[:image3] = a[2] if a.length >= 3

     return return_params
    end
end
