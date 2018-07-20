require 'rails_helper'
# require 'backfill_cbsa_to_msa'

RSpec.describe BackfillZipCodes do
	it "calls zip_to_cbsa and cbsa_to_msa" do		
		expect(BackfillZipToCbsa).to receive(:execute)
		expect(BackfillCbsaToMsa).to receive(:execute)
		
		BackfillZipCodes.execute
	end
end