class CbsaToMsa::ZipCodeUpdater
	def initialize(wrapped_csv_row)
		@csv_row = wrapped_csv_row
	end

	def update_associated_zip_codes
		if should_update_zip_codes?
			associated_zip_codes.update_all(
				cbsa: csv_row.cbsa,
				lsad: csv_row.lsad, 
				msa: csv_row.msa, 
				population_2014: csv_row.population_2014, 
				population_2015: csv_row.population_2015
			)
		end
	end

	private

	def should_update_zip_codes?
		has_associated_zip_codes? && csv_row.is_a_msa?
	end

	def has_associated_zip_codes?
		associated_zip_codes.any?
	end

	def associated_zip_codes
		zip_codes = ZipCode.with_cbsa_and_no_msa(csv_row.mdiv)
		if !zip_codes.any?
			zip_codes = ZipCode.with_cbsa_and_no_msa(csv_row.cbsa)
		end

		zip_codes
	end

	attr_reader :csv_row
end