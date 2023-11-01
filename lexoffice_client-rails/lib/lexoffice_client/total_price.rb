module LexofficeClient
  class TotalPrice < LexofficeClient::Model::Base
    attr_accessor :currency,
      :total_net_amount,
      :total_gross_amount,
      :total_tax_amount,
      :tax_rate_percentage,
      :total_discount_absolute,
      :total_discount_percentage
  end
end
