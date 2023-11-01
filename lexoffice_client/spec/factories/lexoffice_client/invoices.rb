FactoryBot.define do
  factory :lexoffice_client_invoice, class: LexofficeClient::Invoice do
    trait :default do
      after(:build) do |invoice|
        attributes = File.open(LexofficeClient.root.join(*%w[spec files lexoffice_client invoices example.json]))
        invoice.attributes = JSON.parse(attributes.read)
      end
    end

    trait :for_create do
      after(:build) do |invoice|
        attributes = File.open(LexofficeClient.root.join(*%w[spec files lexoffice_client invoices create.json]))
        invoice.attributes = JSON.parse(attributes.read)
      end
    end
  end
end
