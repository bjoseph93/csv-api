class BackfillCbsaToMsa
	def self.execute(csv_array)
		BackfillCbsaToMsa.new(csv_array).update_csv_rows
	end

	def initialize(csv_array)
		@csv_array = csv_array
	end

	def update_csv_rows
		csv_array.each do |csv_row|
			update_zip_code(csv_row)
		end
	end

	def update_zip_code(csv_row)
		if csv_row[4] == "Metropolitan Statistical Area"
			zip_codes = ZipCode.where(cbsa: csv_row[1], msa: nil)
			if zip_codes.any?
				zip_codes.update_all(cbsa: csv_row[0], lsad: csv_row[4], msa: csv_row[3], population_2014: csv_row[11], population_2015: csv_row[12])
			else
				zip_codes = ZipCode.where(cbsa: csv_row[0], msa: nil)
				if zip_codes.any?
					zip_codes.update_all(cbsa: csv_row[0], lsad: csv_row[4], msa: csv_row[3], population_2014: csv_row[11], population_2015: csv_row[12])
				end
			end
		end
	end

	private

	attr_reader :csv_array
end

# [22420, "Flint, MI",	"Metropolitan Statistical Area", 425790, 425790, 425057,421784,	418110,	415695,	412934,	410849]