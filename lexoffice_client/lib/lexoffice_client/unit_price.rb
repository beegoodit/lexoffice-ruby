module LexofficeClient
  class UnitPrice < LexofficeClient::Model::Base
    attr_accessor :currency,
      :net_amount,
      :gross_amount,
      :tax_rate_percentage
  end
end
