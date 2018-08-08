require 'rails_helper'

RSpec.describe BackfillZipCodes do
	it "calls zip_to_cbsa and cbsa_to_msa" do		
		expect(ZipToCbsa::Backfill).to receive(:execute)
		expect(CbsaToMsa::Backfill).to receive(:execute)
		
		BackfillZipCodes.execute
	end
end
