class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(user: session[:usr]) 
    @call = []
  end

  def alert
    session[:alert] = 0
    redirect_to items_path
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
    @item = Item.new(itemcall:false)
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
        format.html { redirect_to items_path, notice: '登録完了！' }
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
    data = delete_image(params[:delete],item_params)
    respond_to do |format|
      if @item.update(data)
        format.html { redirect_to items_path, notice: '更新完了！' }
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
      format.html { redirect_to items_url}
      format.json { head :no_content }
    end
  end
 
  def favcateg
    @categories = Category.where(user: session[:usr])
  end

  def favindex
    @items = Item.where(user: session[:usr]) 
  end


  def wantcateg
    @categories = Category.where(user: session[:usr])
  end

  def wanteindex
    @items = Item.where(user: session[:usr]) 
  end

  def search_tag
    @items = Item.where(user: session[:usr]).tagged_with(params["tag"])
    @pagetitle = 1
    render :index
  end

  def search_category
    @items = Item.where(user: session[:usr]).where(category: params["category"].to_i)
    @pagetitle = 0
    @catename = Category.find(params["category"]).categoryname
    render :index
  end

  def search_favcategory
    @items = Item.where(user: session[:usr]).where(category: params["category"].to_i)
    render :favindex
  end

  def search_wantcategory
    @items = Item.where(user: session[:usr]).where(category: params["category"].to_i)
    render :wantindex
  end

  def skey_index
  end

  def stag_index
  end

  def search_key
    @keyword = params["search_key"]["itemname"]

    if params[:key]
      @categories = Category.where(user: session[:usr]).where("categoryname like '%#{@keyword}'")
      @items = Item.where("itemname like '%#{@keyword}%'")
      render :skey_index
    else
      @items = Item.where(user: session[:usr]).tagged_with(@keyword)
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def delete_image(delete,iparam)
      if delete[:image] == "1"
        iparam[:image] = nil
      end
      if delete[:image2] == "1"
        iparam[:image2] = nil
      end
      if delete[:image3] == "1"
        iparam[:image3] = nil
      end
      return iparam
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      return_params = params.require(:item).permit(:itemname, :itemcall, :situ, :ani, :day, :category_id, :fav, :user_id,:tag_list,:image,:image2,:image3)
      return_params[:image] = return_params[:image].read if return_params[:image] != nil
      return_params[:image2] = return_params[:image2].read  if return_params[:image2] != nil
      return_params[:image3] = return_params[:image3].read  if return_params[:image3] != nil
     return return_params
    end
end
