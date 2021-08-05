require 'rails_helper'

RSpec.describe 'InputFilesController', type: :request do
  describe 'POST /input_files' do
    it 'Usuario logado faz o upload de um arquivo e verifica se está retornando sucesso' do
      user = FactoryBot.create(:user)
      params = { email: user.email, password: user.password }

      post '/users/sign_in', params: params

      params = { file: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/example_input.tab")) }

      post '/input_files', params: params

      expect(response).to redirect_to(company_sales_path)
    end

    it 'Usuario logado tenta salvar sem um arquivo' do
      user = FactoryBot.create(:user)
      params = { email: user.email, password: user.password }

      post '/users/sign_in', params: params

      post '/input_files'

      expect(response).to redirect_to(root_path)
    end

    it 'Usuario nao logado tenta acessar a pagina de upload de arquivos' do
      post '/input_files'

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
