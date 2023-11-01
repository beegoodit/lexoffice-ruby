module LexofficeClient
  class PaymentConditions < LexofficeClient::Model::Base
    attr_accessor :payment_term_label,
      :payment_term_label_template,
      :payment_term_duration
  end
end
