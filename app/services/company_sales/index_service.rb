class CompanySales::IndexService < BusinessProcess::Base
  steps :mount_object

  def call
    process_steps
    @company_sales
  end

  private

  def mount_object
    @company_sales = {}

    return @company_sales unless CompanySale.all.present?

    @company_sales = {
      sales: CompanySale.all,
      total_gross: calculate_gross
    }
  end

  def calculate_gross
    @total_price = []
    CompanySale.all.each do |sale|
      @total_price << sale.item_price * sale.purchase_count
    end

    @total_price.sum
  end
end