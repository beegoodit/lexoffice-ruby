FactoryBot.define do
  factory :lexoffice_client_line_item, class: LexofficeClient::LineItem do
    type { "custom" }
    name { "IT-Services" }
    description { "Webentwicklung" }
    quantity { 1 }
    unit_name { "Stunde" }
    association(:unit_price, factory: :lexoffice_client_unit_price)
    discount_percentage { 0 }
    line_item_amount { 100.0 }
  end
end
