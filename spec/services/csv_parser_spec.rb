require 'rails_helper'

RSpec.describe CsvParser do
	it "removes the correct number of header rows" do
		csv = []
		csv << ["header1", "header2"]
		csv << [100, 200]
		csv << [300, 400]

		expect(CSV).to receive(:read).with("filename", encoding: "GB18030:UTF-8").and_return(csv)

		csv_array = CsvParser.new("filename", 1).array

		expect(csv_array).not_to include(["header1", "header2"])
		expect(csv_array).to include([100, 200])
		expect(csv_array).to include([300, 400])
	end
end