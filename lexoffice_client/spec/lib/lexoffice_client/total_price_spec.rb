require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::TotalPrice do
  let(:total_price_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client total_prices example.json]) }

  subject { described_class.new(JSON.parse(File.read(total_price_json))) }

  describe "currency" do
    it { expect(subject.currency).to eq("EUR") }
  end

  describe "total_net_amount" do
    it { expect(subject.total_net_amount).to eq(100.0) }
  end

  describe "total_gross_amount" do
    it { expect(subject.total_gross_amount).to eq(119.0) }
  end

  describe "total_tax_amount" do
    it { expect(subject.total_tax_amount).to eq(19.0) }
  end
end
