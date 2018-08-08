require 'rails_helper'

RSpec.describe CbsaToMsa::Backfill do
	it "calls the zip_code_updater for each row" do
		msa_array = [
			[
				4000,
				6000,
				48059,
				"Abilene, TX", 
				"Metropolitan Statistical Area",
				165252,
				165252,
				165609,
				166639,
				167578,
				167549,
				168380,
				169578
			],
			[
				4000,
				6000,
				48059,
				"Abilene, TX", 
				"Metropolitan Statistical Area",
				165252,
				165252,
				165609,
				166639,
				167578,
				167549,
				168380,
				169578
			]
		]

		expect(CbsaToMsa::ZipCodeUpdater).to receive(:new).twice.and_call_original
		CbsaToMsa::Backfill.execute(msa_array)
	end
end
