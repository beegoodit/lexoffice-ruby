FactoryBot.define do
  factory :lexoffice_client_unit_price, class: LexofficeClient::UnitPrice do
    currency { "EUR" }
    net_amount { 100 }
    gross_amount { 119 }
    tax_rate_percentage { 19 }
  end
end
