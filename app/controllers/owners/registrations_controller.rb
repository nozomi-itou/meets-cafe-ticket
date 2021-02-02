class Owners::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :configure_sign_up_params, only: [:create]

  def shop_page
    @shops = current_owner.shops.all
  end
 
  protected
 
  def after_sign_up_path_for(resource)
     shop_page_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :post_code, :area_id, :city, :address, :building_name, :phone_number])
  end

end
