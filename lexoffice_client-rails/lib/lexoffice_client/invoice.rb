module LexofficeClient
  class Invoice < LexofficeClient::Model::Base
    attr_accessor :id,
      :organization_id,
      :created_date,
      :updated_date,
      :version,
      :language,
      :archived,
      :voucher_status,
      :voucher_number,
      :voucher_date,
      :due_date,
      :address,
      :line_items,
      :total_price,
      :tax_amounts,
      :tax_conditions,
      :payment_conditions,
      :shipping_conditions,
      :closing_invoice,
      :related_vouchers,
      :introduction,
      :remark,
      :title

    def address=(value)
      @address = value.is_a?(LexofficeClient::Address) ? value : LexofficeClient::Address.new(value)
    end

    def line_items=(value)
      @line_items = value.map { |v| v.is_a?(LexofficeClient::LineItem) ? v : LexofficeClient::LineItem.new(v) }
    end

    def shipping_conditions=(value)
      @shipping_conditions = value.is_a?(LexofficeClient::ShippingConditions) ? value : LexofficeClient::ShippingConditions.new(value)
    end

    def total_price=(value)
      @total_price = value.is_a?(LexofficeClient::TotalPrice) ? value : LexofficeClient::TotalPrice.new(value)
    end

    def tax_amounts=(value)
      @tax_amounts = value.map { |v| v.is_a?(LexofficeClient::TaxAmount) ? v : LexofficeClient::TaxAmount.new(v) }
    end

    def tax_conditions=(value)
      @tax_conditions = value.is_a?(LexofficeClient::TaxConditions) ? value : LexofficeClient::TaxConditions.new(value)
    end

    def related_vouchers=(value)
      @related_vouchers = value.map { |v| v.is_a?(LexofficeClient::RelatedVoucher) ? v : LexofficeClient::RelatedVoucher.new(v) }
    end
  end
end
