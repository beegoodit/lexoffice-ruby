module LexofficeClient
  class TaxAmount < LexofficeClient::Model::Base
    attr_accessor :tax_rate_percentage,
      :tax_amount,
      :net_amount
  end
end
