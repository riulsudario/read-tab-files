class RegistrationsController < Devise::RegistrationsController
  before_action :user_params

  def new
    @registration = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      create_profile

      flash[:notice] = 'User registered'
      redirect_to new_user_session_url
    else
      flash[:alert] = user.errors.full_messages.first.to_s
      redirect_to new_user_registration_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end