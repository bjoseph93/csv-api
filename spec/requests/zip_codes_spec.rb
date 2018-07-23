require 'rails_helper'

RSpec.describe ZipCodesController, :type => :request do
	context "valid zip provided" do
		it "provides a json response with proper output" do
			ZipCode.create!(zip: 48415, cbsa: 10180, msa: "Callahan County, TX", population_2015: 169578, population_2014: 168380)

			expected_response = {
				zip_entries: [
					{
						zip: 48415,
						cbsa: 10180,
						msa: "Callahan County, TX",
						"population_2015" => 169578,
						"population_2014" => 168380
					}
				]
			}.to_json
			
			get "/zip_codes?zip=48415"

			expect(response.body).to eq(expected_response)
		end
	end

	context "invalid zip provided" do
		it "provides a json response with proper output" do
			ZipCode.create!(zip: 48415, cbsa: 10180, msa: "Callahan County, TX", population_2015: 169578, population_2014: 168380)

			expected_response = "Parameter 'zip' must be an integer."
			
			get "/zip_codes?zip=a"

			expect(response.body).to eq(expected_response)
			expect(response.status).to eq(422)

		end
	end

	context "no zip provided" do
		it "provides a json response with proper output" do
			ZipCode.create!(zip: 48415, cbsa: 10180, msa: "Callahan County, TX", population_2015: 169578, population_2014: 168380)

			expected_response = "Missing required parameter 'zip'."
			
			get "/zip_codes"

			expect(response.body).to eq(expected_response)
			expect(response.status).to eq(400)
		end
	end
end