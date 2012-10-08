class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  private :resource_params
end