require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::UnitPrice do
  let(:unit_price_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client unit_prices example.json]) }

  subject { described_class.new(JSON.parse(File.read(unit_price_json))) }

  describe "currency" do
    it { expect(subject.currency).to eq("EUR") }
  end

  describe "net_amount" do
    it { expect(subject.net_amount).to eq(100.0) }
  end

  describe "gross_amount" do
    it { expect(subject.gross_amount).to eq(119.0) }
  end

  describe "tax_rate_percentage" do
    it { expect(subject.tax_rate_percentage).to eq(19.0) }
  end
end
