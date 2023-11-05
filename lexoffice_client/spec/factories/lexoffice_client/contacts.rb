FactoryBot.define do
  factory :lexoffice_client_contact, class: LexofficeClient::Contact do
    addresses { {"billing" => [build(:lexoffice_client_address)]} }
  end
end
