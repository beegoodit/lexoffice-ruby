require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::ShippingConditions do
  let(:shipping_conditions_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client shipping_conditions example.json]) }

  subject { described_class.new(JSON.parse(File.read(shipping_conditions_json))) }

  describe "shipping_date" do
    it { expect(subject.shipping_date).to eq("2023-08-31T00:00:00.000+02:00") }
  end

  describe "shipping_type" do
    it { expect(subject.shipping_type).to eq("delivery") }
  end
end
