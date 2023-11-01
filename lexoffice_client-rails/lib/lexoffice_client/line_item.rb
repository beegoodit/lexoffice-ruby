module LexofficeClient
  class LineItem < LexofficeClient::Model::Base
    attr_accessor :id,
      :type,
      :name,
      :description,
      :quantity,
      :unit_name,
      :unit_price,
      :discount_percentage,
      :line_item_amount

    def unit_price=(value)
      @unit_price = value.is_a?(LexofficeClient::UnitPrice) ? value : LexofficeClient::UnitPrice.new(value)
    end
  end
end
