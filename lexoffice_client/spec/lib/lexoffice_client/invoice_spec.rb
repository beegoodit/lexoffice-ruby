require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Invoice do
  let(:invoice_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client invoices example.json]) }

  subject { described_class.new(JSON.parse(File.read(invoice_json))) }

  describe "address" do
    it { expect(subject.address).to be_a(LexofficeClient::Address) }
  end

  describe "line_items" do
    it { expect(subject.line_items).to be_a(Array) }
    it { expect(subject.line_items.size).to eq(1) }
    it { expect(subject.line_items.first).to be_a(LexofficeClient::LineItem) }
  end

  describe "shipping_conditions" do
    it { expect(subject.shipping_conditions).to be_a(LexofficeClient::ShippingConditions) }
  end

  describe "total_price" do
    it { expect(subject.total_price).to be_a(LexofficeClient::TotalPrice) }
  end

  describe "tax_amounts" do
    it { expect(subject.tax_amounts).to be_a(Array) }
    it { expect(subject.tax_amounts.size).to eq(1) }
    it { expect(subject.tax_amounts.first).to be_a(LexofficeClient::TaxAmount) }
  end

  describe "tax_conditions" do
    it { expect(subject.tax_conditions).to be_a(LexofficeClient::TaxConditions) }
  end

  describe "related_vouchers" do
    it { expect(subject.related_vouchers).to be_a(Array) }
    it { expect(subject.related_vouchers.size).to eq(0) }
  end
end
