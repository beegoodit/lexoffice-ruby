require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::PaymentConditions do
  let(:payment_conditions_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client payment_conditions example.json]) }

  subject { described_class.new(JSON.parse(File.read(payment_conditions_json))) }

  describe "payment_term_label" do
    it { expect(subject.payment_term_label).to eq("Zahlbar sofort, rein netto") }
  end

  describe "payment_term_label_template" do
    it { expect(subject.payment_term_label_template).to eq("Zahlbar sofort, rein netto") }
  end

  describe "payment_term_duration" do
    it { expect(subject.payment_term_duration).to eq(0) }
  end
end
