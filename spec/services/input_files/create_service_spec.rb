require 'rails_helper'

RSpec.describe 'InputFiles::CreateService', type: :service do
  describe 'Manipulação do arquivo tab' do
    it 'Usuario logado passa um arquivo tab e verifica se retornou sucesso' do
      user = FactoryBot.create(:user)

      service = InputFiles::CreateService.call(file_params: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/example_input.tab")),
                                               current_user: user)

      expect(service.success?).to be_truthy
    end

    it 'Usuario deslogado passa um arquivo tab' do
      user = FactoryBot.create(:user)

      service = InputFiles::CreateService.call(file_params: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/example_input.tab")),
                                               current_user: nil)

      expect(service.success?).to be_falsey
      expect(service.error).to eq('You must be logged to upload a file')
    end

    it 'Usuario logado passa um arquivo que não é tab' do
      user = FactoryBot.create(:user)

      service = InputFiles::CreateService.call(file_params: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/404.html")),
                                               current_user: user)

      expect(service.success?).to be_falsey
      expect(service.error).to eq('File needs to be .tab or .csv')
    end

    it 'Usuario deslogado passa um arquivo que não é tab' do
      service = InputFiles::CreateService.call(file_params: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/404.html")),
                                               current_user: nil)

      expect(service.success?).to be_falsey
      expect(service.error).to eq('You must be logged to upload a file')
    end
  end
end
