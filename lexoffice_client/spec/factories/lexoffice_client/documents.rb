FactoryBot.define do
  factory :lexoffice_client_document, class: LexofficeClient::Document do
    original_filename { "Rechnung_RE0009.pdf" }
    content_type { "application/pdf" }
    blob { File.read(LexofficeClient.root.join(*%w[spec files lexoffice_client documents example.pdf])) }
  end
end
