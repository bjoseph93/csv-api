require 'rails_helper'

RSpec.describe ZipCodesController, :type => :request do
	it "provides a json response with proper output" do
		expected_response = {
			zip: 95765,
			cbsa: 10180,
			msa: "Callahan County, TX",
			"population_2015" => 169578,
			"population_2014" => 168380
		}.to_json
		
		get "/zip_codes"

		expect(response.body).to eq(expected_response)

		puts(response)
	end

end