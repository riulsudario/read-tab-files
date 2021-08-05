class ::Users::FacebookAuthService < BusinessProcess::Base
  needs :fb_auth_params

  steps :fetch_facebook,
        :find_facebook_user,
        :find_user,
        :create_user

  def call
    process_steps
    @user
  end

  private

  def fetch_facebook
    graph = Koala::Facebook::API.new(fb_auth_params[:access_token])
    begin
      @facebook_user = graph.get_object('me', fields: [:name, :email])
    rescue StandardError
      fail(:facebook_auth_error)
    rescue StandardError
      fail(:unknow_error)
    end
  end

  def find_facebook_user
    @facebook = @facebook_user.symbolize_keys
    @user = User.find_by(provider: 'facebook', uid: @facebook[:id])
  end

  def find_user
    return if @user.present?

    @user = User.find_by(email: @facebook[:email])
  end

  def create_user
    return if @user.present?

    @user = User.create(provider: 'facebook', uid: @facebook[:id],
                        email: define_email(@facebook), name: @facebook[:name],
                        password: Devise.friendly_token[0, 20])
    @user.save
    fail(@user.errors.full_messages) if @user.errors.present?
  end

  def define_email(fb_user)
    fb_user[:email].present? ? fb_user[:email] : "#{fb_user[:id]}@email.com.br"
  end
end
