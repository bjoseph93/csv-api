require 'rails_helper'

RSpec.describe ZipToCbsa::CsvRowWrapper do
	it "correctly wraps an array" do
		csv_row = [
				500,
				6000,
		]

		wrapper = ZipToCbsa::CsvRowWrapper.new(csv_row)

		expect(wrapper.zip).to eq(500)
		expect(wrapper.cbsa).to eq(6000)
	end
end
