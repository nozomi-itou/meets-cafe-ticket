# frozen_string_literal: true

class Owners::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  def shop_page

  end
 
  protected
 
  def after_sign_up_path_for(resource)
     shop_page_path
  end
end
