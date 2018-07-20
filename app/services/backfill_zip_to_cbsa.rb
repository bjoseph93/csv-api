class BackfillZipToCbsa
	def self.execute(csv_array)
		BackfillZipToCbsa.new(csv_array).create_zip_code_rows
	end

	def initialize(csv_array)
		@csv_array = csv_array
	end

	def create_zip_code_rows
		csv_array.each do |csv_row|
			create_zip_code_row(csv_row[0], csv_row[1])
		end
	end

	def create_zip_code_row(zip, cbsa)
		ZipCode.create!(zip: zip, cbsa: cbsa)
	end

	private

	attr_reader :csv_array
end