require 'net/http'

RSpec.describe RandomGem do
  let(:response) { [{"documentation_uri"=>"sample_uri", "name"=>"sample_name"}] }

  before do
    double = instance_double(RandomGem::Request)
    allow(RandomGem::Request).to receive(:new).and_return(double)
    allow(double).to receive(:do).and_return(response)
  end

  it "has a version number" do
    expect(RandomGem::VERSION).not_to be nil
  end

  describe "#pick" do
    it "returns random gem response" do
      gem = RandomGem.pick

      expect( gem.class ).to eq Hash
      expect( gem["documentation_uri"] ).to eq "sample_uri"
      expect( gem["name"] ).to eq "sample_name"
    end
  end
end
