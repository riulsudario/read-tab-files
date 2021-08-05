require 'rails_helper'

RSpec.describe 'RegistrationsController', type: :request do
  describe 'POST /users' do
    it 'Cria o usuario que ainda nao foi criado na plataforma com todos os dados corretos' do
      params = { email: 'riul@email.com', name: 'Riul Sudario de Souza', password: 'secret123' }

      post '/users', params: params

      expect(response).to redirect_to(new_user_session_url)
    end

    it 'Tenta criar um usuario com um email ja cadastrado na plataforma' do
      user = FactoryBot.create(:user)

      params = { email: user.email, name: 'Riul Sudario de Souza', password: 'secret123' }

      post '/users', params: params

      expect(response).to redirect_to(new_user_registration_path)
    end

    it 'Tenta criar um usuario com dados faltando' do
      user = FactoryBot.create(:user)

      params = { email: user.email, password: 'secret123' }

      post '/users', params: params

      expect(response).to redirect_to(new_user_registration_path)
    end
  end
end
