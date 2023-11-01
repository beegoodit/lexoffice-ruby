FactoryBot.define do
  factory :lexoffice_client_tax_amount, class: LexofficeClient::TaxAmount do
    tax_rate_percentage { 19.00 }
    tax_amount { 19.00 }
    net_amount { 100.00 }
  end
end
