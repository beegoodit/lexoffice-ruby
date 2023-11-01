require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient::RelatedVoucher do
  let(:related_voucher_json) { LexofficeClient.root.join(*%w[spec files lexoffice_client related_vouchers example.json]) }

  subject { described_class.new(JSON.parse(File.read(related_voucher_json))) }
end
