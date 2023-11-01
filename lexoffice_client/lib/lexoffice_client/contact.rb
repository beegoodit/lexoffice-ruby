module LexofficeClient
  class Contact < LexofficeClient::Model::Base
    attr_accessor :id,
      :organization_id,
      :version,
      :roles,
      :company,
      :addresses,
      :archived,
      :email_addresses

    def addresses=(values)
      @addresses = values.each_with_object({}) do |(key, value), hash|
        hash[key] = value.map { |v| v.is_a?(LexofficeClient::Address) ? v : LexofficeClient::Address.new(v) }
      end
    end

    def company=(value)
      @company = value.is_a?(LexofficeClient::Company) ? value : LexofficeClient::Company.new(value)
    end

    def roles=(values)
      @roles = values.each_with_object({}) do |(key, value), hash|
        hash[key] = value.is_a?(LexofficeClient::Role) ? value : "LexofficeClient::#{key.camelize}".constantize.new(value)
      end
    end

    # def address=(value)
    #  @address = value.is_a?(LexofficeClient::Address) ? value : LexofficeClient::Address.new(value)
    # end

    # def line_items=(value)
    #  @line_items = value.map { |v| v.is_a?(LexofficeClient::LineItem) ? v : LexofficeClient::LineItem.new(v) }
    # end
  end
end
