require 'rails_helper'

RSpec.describe 'SessionsController', type: :request do
  describe 'POST /users/sign_in' do
    it 'Faz o login com as credenciais corretas' do
      user = FactoryBot.create(:user)
      params = { email: user.email, password: user.password }

      post '/users/sign_in', params: params

      expect(response).to redirect_to(root_path)
    end

    it 'Tenta fazer o login com as credenciais incorretas' do
      FactoryBot.create(:user)

      params = { email: 'email@errado.com', password: 'senha incorreta' }

      post '/users/sign_in', params: params

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
