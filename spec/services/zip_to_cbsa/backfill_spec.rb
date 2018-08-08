require 'rails_helper'

RSpec.describe ZipToCbsa::Backfill do
	it "populates database from array of arrays" do
		zip_array = [
			[501, 35004],
			[601, 10260]
		]

		ZipToCbsa::Backfill.execute(zip_array)

		expect(ZipCode.first.zip).to eq(zip_array[0][0])
		expect(ZipCode.first.cbsa).to eq(zip_array[0][1])
		expect(ZipCode.second.zip).to eq(zip_array[1][0])
		expect(ZipCode.second.cbsa).to eq(zip_array[1][1])
	end
end
