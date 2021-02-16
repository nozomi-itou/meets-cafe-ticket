class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  def my_page
    if user_signed_in?
      @user = User.new(id: current_user.id)
    end

  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end
  
 
  protected
 
  def after_sign_up_path_for(resource)
     my_page_path
  end

end
