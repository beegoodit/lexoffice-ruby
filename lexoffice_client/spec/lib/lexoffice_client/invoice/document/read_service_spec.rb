require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::Invoice::Document::ReadService, type: :service, vcr: true do
  before(:each) do
    expect(LexofficeClient::Configuration).to receive(:api_base_url).and_return(-> { "https://api.lexoffice.io/v1" }).at_least(:once)
  end

  describe "basic usage" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return(-> { "n2.o0c.raladGqUDySbv9ZKZaNKME0pf7W3YulfNjlaTV1TC" }).at_least(:once)
    end

    describe "result" do
      let(:invoice_id) { "6abbe641-e525-4ebf-858c-8f4f57657705" }
      let(:attributes) {
        {
          invoice_id: invoice_id
        }
      }
      let(:options) { {} }

      subject { described_class.call(attributes, options) }

      it { expect(subject).to be_a(Rao::Service::Result::Base) }
      it { expect(subject).to be_ok }

      describe "document" do
        subject { described_class.call(attributes, options).document }

        it { expect(subject).to be_a(LexofficeClient::Document) }
      end
    end
  end

  describe "when the invoice is a draft" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return(-> { "n2.o0c.raladGqUDySbv9ZKZaNKME0pf7W3YulfNjlaTV1TC" }).at_least(:once)
    end

    describe "result" do
      let(:invoice_id) { "59a3008f-9d96-4629-92ed-74fdbb2a4767" }
      let(:attributes) {
        {
          invoice_id: invoice_id
        }
      }
      let(:options) { {} }

      subject { described_class.call(attributes, options) }

      it { expect(subject).to be_a(Rao::Service::Result::Base) }
      it { expect(subject).to_not be_ok }
      it { expect(subject.errors[:request]).to include("HTTP Error: 406 - Requesting PDF document is not possible in state draft.") }

      describe "document" do
        subject { described_class.call(attributes, options).document }

        it { expect(subject).to be_nil }
      end
    end
  end

  describe "when not authorized" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return(-> { "invalid-token" })
    end

    describe "result" do
      let(:invoice_id) { "59a3008f-9d96-4629-92ed-74fdbb2a4767" }
      let(:attributes) {
        {
          invoice_id: invoice_id
        }
      }
      let(:options) { {} }

      subject { described_class.call(attributes, options) }

      it { expect(subject).to be_a(Rao::Service::Result::Base) }
      it { expect(subject).to_not be_ok }
      it { expect(subject.errors[:request]).to include("HTTP Error: 401") }
    end
  end
end
