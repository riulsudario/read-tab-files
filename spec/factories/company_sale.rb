FactoryBot.define do
  factory :company_sale do
    purchaser_name { 'Riul Sudario de Souza' }
    item_description { 'Cupom de 50% de desconto em ferramentas' }
    item_price { 100 }
    purchase_count { 1 }
    merchant_address { 'Rua da Divisão, 295' }
    merchant_name { 'Tye ferramentas' }
  end
end
