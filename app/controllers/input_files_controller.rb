class InputFilesController < ApplicationController
  def index
  end

  def create
    service = InputFiles::CreateService.call(file_params: file_params[:file])

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