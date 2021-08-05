class CompanySalesController < ApplicationController
  def index
    service = CompanySales::IndexService.call(nil)

    @company_sales = service.result
  end
end