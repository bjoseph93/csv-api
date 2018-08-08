class ZipToCbsa::Backfill
	def self.execute(csv_array)
		ZipToCbsa::Backfill.new(csv_array).create_zip_code_rows
	end

	def initialize(csv_array)
		@csv_array = csv_array
	end

	def create_zip_code_rows
		csv_array.each do |csv_row|
			wrapped_csv_row = ZipToCbsa::CsvRowWrapper.new(csv_row)
			create_zip_code_row(wrapped_csv_row.zip, wrapped_csv_row.cbsa)
		end
	end

	def create_zip_code_row(zip, cbsa)
		ZipCode.create!(zip: zip, cbsa: cbsa)
	end

	private

	attr_reader :csv_array
end
