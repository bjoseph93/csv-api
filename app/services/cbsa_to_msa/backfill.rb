class CbsaToMsa::Backfill
	def self.execute(csv_array)
		CbsaToMsa::Backfill.new(csv_array).update_csv_rows
	end

	def initialize(csv_array)
		@csv_array = csv_array
	end

	def update_csv_rows
		csv_array.each do |csv_row|
			update_zip_code(CbsaToMsa::CsvRowWrapper.new(csv_row))
		end
	end

	def update_zip_code(csv_row)
		CbsaToMsa::ZipCodeUpdater.new(csv_row).update_associated_zip_codes
	end

	private

	attr_reader :csv_array
end