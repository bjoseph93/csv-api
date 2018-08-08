class CbsaToMsa::CsvRowWrapper
		def initialize(csv_row)
			@csv_row = csv_row
		end

		def cbsa
			csv_row[0]
		end

		def mdiv
			csv_row[1]
		end

		def msa
			csv_row[3]
		end

		def lsad
			csv_row[4]
		end

		def population_2014
			csv_row[11]
		end

		def population_2015
			csv_row[12]
		end

		def is_a_msa?
			lsad == "Metropolitan Statistical Area"
		end

		private

		attr_reader :csv_row

	end