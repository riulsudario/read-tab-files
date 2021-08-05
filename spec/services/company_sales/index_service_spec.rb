require 'rails_helper'

RSpec.describe 'CompanySales::IndexService', type: :service do
  describe 'Gera os relatórios' do
    it 'Verifica as records no banco de dados preenchido e lista as vendas e o valor total' do
      user = FactoryBot.create(:user)

      10.times { FactoryBot.create(:company_sale, user: user) }

      service = CompanySales::IndexService.call(current_user: user)

      expect(service.success?).to be_truthy
      expect(service.result[:total_gross].present?).to be_truthy
      expect(service.result[:total_gross]).to eq(1000)
      expect(service.result[:sales].present?).to be_truthy
    end

    it 'Procura as informacoes no banco (vazio)' do
      user = FactoryBot.create(:user)

      service = CompanySales::IndexService.call(current_user: user)

      expect(service.success?).to be_truthy
      expect(service.result).to be_empty
    end
  end
end
