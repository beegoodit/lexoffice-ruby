FactoryBot.define do
  factory :lexoffice_client_tax_conditions, class: LexofficeClient::TaxConditions do
    tax_type { "net" }
  end
end
