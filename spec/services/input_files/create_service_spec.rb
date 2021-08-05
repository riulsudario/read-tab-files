require 'rails_helper'

RSpec.describe InputFiles::CreateService, type: :service do
  describe 'Manipulação do arquivo tab' do
    it 'Passa um arquivo tab e verifica se retornou sucesso' do
      service = InputFiles::CreateService.call(file_params: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/example_input.tab")))

      expect(service.success?).to be_truthy
    end

    it 'Passa um arquivo que não é tab' do
      service = InputFiles::CreateService.call(file_params: Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/404.html")))

      expect(service.success?).to be_falsey
      expect(service.error).to eq('File needs to be .tab or .csv')
    end
  end
end
