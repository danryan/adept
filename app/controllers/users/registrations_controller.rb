class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
  
  private :resource_params
end