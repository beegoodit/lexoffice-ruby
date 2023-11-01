FactoryBot.define do
  factory :lexoffice_client_shipping_conditions, class: LexofficeClient::ShippingConditions do
    shipping_date { "2023-08-31T00:00:00.000+02:00" }
    shipping_type { "delivery" }
  end
end
