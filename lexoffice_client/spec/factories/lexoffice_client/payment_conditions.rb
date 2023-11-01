FactoryBot.define do
  factory :lexoffice_client_payment_conditions, class: LexofficeClient::PaymentConditions do
    payment_term_label { "Zahlbar sofort, rein netto" }
    payment_term_label_template { "Zahlbar sofort, rein netto" }
    payment_term_duration { 0 }
  end
end
