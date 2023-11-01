FactoryBot.define do
  factory :lexoffice_client_address, class: LexofficeClient::Address do
    name { "Art der Gestaltung GbR" }
    supplement { "c/o Christoph Bönning" }
    street { "Parkstraße 17" }
    city { "Bad Vilbel" }
    zip { "61118" }
    country_code { "DE" }
  end
end
