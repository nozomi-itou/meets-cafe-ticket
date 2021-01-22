class HomeController < ApplicationController
  def index
    @shops = Shop.includes(:owner).order("created_at DESC")
  end
end
