class ShopsController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show, :search]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]


  def index
    @shops = Shop.includes(:owner).order("created_at DESC")
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path(@shop)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @shop.comments.includes(:user).order("created_at DESC")
  end

  def search
    @shops = Shop.search(params[:keyword])
  end

  def edit
    if @shop.owner_id != current_owner.id
      redirect_to action: :index
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_page_path
    else
      render :edit
    end
  end

  def destroy
    if @shop.owner_id == current_owner.id
      if @shop.destroy
        redirect_to shop_page_path
      else
        render :show
      end
    else
      render :show
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :shop_name, :address, :phone, :open_close, :drink, :area_id).merge(owner_id: current_owner.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
