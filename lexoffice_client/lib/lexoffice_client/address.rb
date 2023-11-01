module LexofficeClient
  class Address < LexofficeClient::Model::Base
    attr_accessor :name, :supplement, :street, :city, :zip, :country_code, :contact_id
  end
end
