require 'rails_helper'

RSpec.describe CbsaToMsa::CsvRowWrapper do
	it "correctly wraps an array" do
		csv_row = [
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

		wrapper = CbsaToMsa::CsvRowWrapper.new(csv_row)

		expect(wrapper.cbsa).to eq(4000)
		expect(wrapper.mdiv).to eq(6000)
		expect(wrapper.msa).to eq("Abilene, TX")
		expect(wrapper.lsad).to eq("Metropolitan Statistical Area")
		expect(wrapper.population_2014).to eq(168380)
		expect(wrapper.population_2015).to eq(169578)
		expect(wrapper.is_a_msa?).to eq(true)

	end
end
