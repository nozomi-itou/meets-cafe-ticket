class ShopsController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show]

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

  def edit
  end

  def show
    @shops = Shop.includes(:owner).order("created_at DESC")
  end


  private

  def shop_params
    params.require(:shop).permit(:image, :shop_name, :address, :phone, :open_close, :drink, :category_id, :area_id).merge(owner_id: current_owner.id)
  end

end
