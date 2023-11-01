require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::File::ReadService, type: :service, vcr: true do
  before(:each) do
    expect(LexofficeClient::Configuration).to receive(:api_base_url).and_return("https://api.lexoffice.io/v1")
  end

  describe "basic usage" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return("n2.o0c.raladGqUDySbv9ZKZaNKME0pf7W3YulfNjlaTV1TC")
    end

    let(:file_id) { "2d5eb49b-3f1f-44dd-aa68-f4d342f2b039" }
    let(:attributes) { {file_id: file_id} }
    let(:options) { {} }

    subject { described_class.call(attributes, options) }

    describe "result" do
      it { expect(subject).to be_a(Rao::Service::Result::Base) }

      describe "file_io" do
        subject { described_class.call(attributes, options).file_io }

        it { expect(subject).to be_a(LexofficeClient::Document) }
        it { expect(subject.original_filename).to eq("Rechnung_RE0009.pdf") }
        it { expect(subject.content_type).to eq("application/pdf") }
      end
    end
  end

  describe "when not authorized" do
    before(:each) do
      expect(LexofficeClient::Configuration).to receive(:api_token).and_return("invalid-token")
    end

    describe "result" do
      let(:file_id) { "2d5eb49b-3f1f-44dd-aa68-f4d342f2b039" }
      let(:attributes) {
        {
          file_id: file_id
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
