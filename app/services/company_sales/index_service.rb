class CompanySales::IndexService < BusinessProcess::Base
  needs :current_user

  steps :mount_object

  def call
    process_steps
    @company_sales
  end

  private

  def mount_object
    @company_sales = {}

    return @company_sales unless current_user.company_sales.present?

    @company_sales = {
      sales: CompanySale.all,
      total_gross: calculate_gross
    }
  end

  def calculate_gross
    @total_price = []
    current_user.company_sales.each do |sale|
      @total_price << sale.item_price * sale.purchase_count
    end

    @total_price.sum
  end
end