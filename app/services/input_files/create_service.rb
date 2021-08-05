class InputFiles::CreateService < BusinessProcess::Base
  needs :file_params
  needs :current_user

  steps :parse_data,
        :manipulate_data,
        :calculate_gross

  def call
    process_steps
    @total_price
  end

  private

  def parse_data
    return fail('File is required') unless file_params.present?

    return fail('File needs to be .tab or .csv') unless verify_file

    @parsed_data = SmarterCSV.process(file_params, { col_sep: "\t" })

    fail unless @parsed_data.present?
  end

  def verify_file
    file_params.original_filename.include?('.tab' || '.csv')
  end

  def manipulate_data
    @total_price = []

    @parsed_data.each do |data|
      save_data(data)
      iterates_values(data)
    end
  end

  def save_data(data)
    CompanySale.create(purchaser_name: data[:purchaser_name], item_description: data[:item_description],
                       item_price: data[:item_price], purchase_count: data[:purchase_count],
                       merchant_address: data[:merchant_address], merchant_name: data[:merchant_name])
  end

  def iterates_values(data)
    @total_price << data[:item_price] * data[:purchase_count]
  end

  def calculate_gross
    @total_price = @total_price.sum
  end
end