# frozen_string_literal: true

class Owners::SessionsController < Devise::SessionsController
  protected
 
  def after_sign_in_path_for(resource)
    shop_page_path
  end
end
