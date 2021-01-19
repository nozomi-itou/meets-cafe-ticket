class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  def my_page
    @user = User.new(id: current_user.id)
  end
 
  protected
 
  def after_sign_up_path_for(resource)
     my_page_path
  end

end
