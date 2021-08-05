class CompanySalesController < ApplicationController
  before_action :authenticate_user!

  def index
    service = CompanySales::IndexService.call(current_user: current_user)

    @company_sales = service.result
  end
end