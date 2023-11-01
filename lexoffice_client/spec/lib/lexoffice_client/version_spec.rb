require "lexoffice_client"
require "spec_helper"

RSpec.describe LexofficeClient do
  it { expect(described_class::VERSION).to be_a(String) }
end
