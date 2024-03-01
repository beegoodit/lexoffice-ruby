module LexofficeClient
  class Company < LexofficeClient::Model::Base
    attr_accessor :allow_tax_free_invoices, :contact_persons, :name, :tax_number, :vat_registration_id
  end
end
