FactoryBot.define do
  factory :lexoffice_client_total_price, class: LexofficeClient::TotalPrice do
    currency { "EUR" }
    total_net_amount { 100.00 }
    total_gross_amount { 119.00 }
    total_tax_amount { 19.00 }
  end
end
