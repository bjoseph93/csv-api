class ZipToCbsa::CsvRowWrapper
	def initialize(csv_row)
		@csv_row = csv_row
	end

	def zip
		csv_row[0]
	end

	def cbsa
		csv_row[1]
	end

	private

	attr_reader :csv_row
end