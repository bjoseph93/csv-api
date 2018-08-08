require 'rails_helper'

RSpec.describe CbsaToMsa::ZipCodeUpdater do
	context "the row has a mdiv that matches a cbsa" do
		msa_array = [
				4000,
				6000,
				48059,
				"Abilene, TX", "Metropolitan Statistical Area",
				165252,
				165252,
				165609,
				166639,
				167578,
				167549,
				168380,
				169578
			]

		it "replaces the existing cbsa with the new cbsa" do
			text_zip = ZipCode.create!(zip: 500, cbsa: 6000)
			

			wrapped_array = CbsaToMsa::CsvRowWrapper.new(msa_array)
			CbsaToMsa::ZipCodeUpdater.new(wrapped_array).update_associated_zip_codes
			expect(ZipCode.first.cbsa).to eq(4000)
		end

		it "updates the attributes of matching row" do
			text_zip = ZipCode.create!(zip: 500, cbsa: 6000)

			wrapped_array = CbsaToMsa::CsvRowWrapper.new(msa_array)
			CbsaToMsa::ZipCodeUpdater.new(wrapped_array).update_associated_zip_codes

			expect(ZipCode.first.lsad).to eq("Metropolitan Statistical Area")
			expect(ZipCode.first.msa).to eq("Abilene, TX")
			expect(ZipCode.first.cbsa).to eq(4000)
			expect(ZipCode.first.population_2015).to eq(169578)
			expect(ZipCode.first.population_2014).to eq(168380)
		end
	end

	context "there is a mdiv that does not match a cbsa" do
		context "the cbsa matches an existing cbsa" do
			it "updates the attributes of matching row" do
				text_zip = ZipCode.create!(zip: 500, cbsa: 6000)
				msa_array = [
					6000,
					5000,
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

				

				wrapped_array = CbsaToMsa::CsvRowWrapper.new(msa_array)
				CbsaToMsa::ZipCodeUpdater.new(wrapped_array).update_associated_zip_codes

				expect(ZipCode.first.lsad).to eq("Metropolitan Statistical Area")
				expect(ZipCode.first.msa).to eq("Abilene, TX")
				expect(ZipCode.first.cbsa).to eq(6000)
				expect(ZipCode.first.population_2015).to eq(169578)
				expect(ZipCode.first.population_2014).to eq(168380)
			end
		end

		context "the cbsa does not match an existing cbsa" do
			it "does not update a ZipCode" do
				text_zip = ZipCode.create!(zip: 500, cbsa: 6000)
				msa_array = [
					4000,
					5000,
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

				wrapped_array = CbsaToMsa::CsvRowWrapper.new(msa_array)
				CbsaToMsa::ZipCodeUpdater.new(wrapped_array).update_associated_zip_codes

				expect(ZipCode.first.lsad).to be(nil)
				expect(ZipCode.first.msa).to be(nil)
				expect(ZipCode.first.cbsa).to eq(6000)
				expect(ZipCode.first.population_2015).to be(nil)
				expect(ZipCode.first.population_2014).to be(nil)
			end
		end
		
	end

	context "there is no mdiv" do 
		it "updates matching attributes of matching cbsa" do
			text_zip = ZipCode.create!(zip: 500, cbsa: 4000)
			msa_array = [
				4000,
				nil,
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
			

			wrapped_array = CbsaToMsa::CsvRowWrapper.new(msa_array)
			CbsaToMsa::ZipCodeUpdater.new(wrapped_array).update_associated_zip_codes

			expect(ZipCode.first.lsad).to eq("Metropolitan Statistical Area")
			expect(ZipCode.first.msa).to eq("Abilene, TX")
			expect(ZipCode.first.cbsa).to eq(4000)
			expect(ZipCode.first.population_2015).to eq(169578)
			expect(ZipCode.first.population_2014).to eq(168380)
		end
	end

	context "the lsad is not Metropolitan Statistical Area" do 
		it "does not update the zip code" do
			text_zip = ZipCode.create!(zip: 500, cbsa: 6000)
				msa_array = [
					6000,
					5000,
					48059,
					"Abilene, TX",
					"County or equivalent",
					165252,
					165252,
					165609,
					166639,
					167578,
					167549,
					168380,
					169578
				]

				wrapped_array = CbsaToMsa::CsvRowWrapper.new(msa_array)
				CbsaToMsa::ZipCodeUpdater.new(wrapped_array).update_associated_zip_codes

				
				expect(ZipCode.first.lsad).to be(nil)
				expect(ZipCode.first.msa).to be(nil)
				expect(ZipCode.first.cbsa).to eq(6000)
				expect(ZipCode.first.population_2015).to be(nil)
				expect(ZipCode.first.population_2014).to be(nil)
		end
	end

	context "a zip code is already associated with a msa" do
		it "does not update the zip code" do
			text_zip = ZipCode.create!(zip: 500, cbsa: 6000, msa: "Callahan County, TX")
				msa_array = [
					6000,
					5000,
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

				wrapped_array = CbsaToMsa::CsvRowWrapper.new(msa_array)
				CbsaToMsa::ZipCodeUpdater.new(wrapped_array).update_associated_zip_codes

				expect(ZipCode.first.lsad).to be(nil)
				expect(ZipCode.first.msa).to eq("Callahan County, TX")
				expect(ZipCode.first.cbsa).to eq(6000)
				expect(ZipCode.first.population_2015).to be(nil)
				expect(ZipCode.first.population_2014).to be(nil)
		end
	end
end