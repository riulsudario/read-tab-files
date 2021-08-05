require 'rails_helper'

RSpec.describe 'InputFilesController', type: :request do
  describe 'POST /input_files' do
    it 'Faz o upload de um arquivo e verifica se está retornando sucesso' do
      params = { file: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/example_input.tab")) }

      post '/input_files', params: params

      expect(response).to redirect_to(company_sales_path)
    end

    it 'Tenta salvar sem um arquivo' do
      post '/input_files'

      expect(response).to redirect_to(root_path)
    end
  end
end
