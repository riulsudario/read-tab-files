class InputFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    service = InputFiles::CreateService.call(file_params: file_params[:file], current_user: current_user)

    if service.success?
      redirect_to company_sales_path
      flash[:notice] = "The gross of the file inputed is: #{service.result}"
    else
      redirect_to root_path
      flash[:error] = service.error
    end
  end

  private

  def file_params
    params.permit(:file)
  end
end