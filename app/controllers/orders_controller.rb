class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(user_id: current_user.id, token: params[:token])
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: 500, 
        card: params[:token], 
        currency: 'jpy'
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


end

