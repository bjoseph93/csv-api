class ZipCode < ApplicationRecord
	validates :zip, presence: true


	scope :with_cbsa_and_no_msa, ->(cbsa) {
		where(cbsa: cbsa, msa: nil)
	}


	# class ZipCodeUpdater
	# 	def initialize(wrapped_csv_row)
	# 		@csv_row = wrapped_csv_row
	# 	end

	# 	def update_associated_zip_codes
	# 		if should_update_zip_codes?
	# 			associated_zip_codes.update_all(
	# 				cbsa: csv_row.cbsa,
	# 				lsad: csv_row.lsad, 
	# 				msa: csv_row.msa, 
	# 				population_2014: csv_row.population_2014, 
	# 				population_2015: csv_row.population_2015
	# 			)
	# 		end
	# 	end

	# 	private

	# 	def should_update_zip_codes?
	# 		has_associated_zip_codes? && csv_row.is_a_msa?
	# 	end

	# 	def has_associated_zip_codes?
	# 		associated_zip_codes.any?
	# 	end

	# 	def associated_zip_codes
	# 		ZipCode.where(cbsa: zip_code_cbsa, msa: nil)
	# 	end

	# 	def zip_code_cbsa
	# 		if ZipCode.where(cbsa: csv_row.mdiv, msa: nil).any?
	# 			csv_row.mdiv
	# 		else
	# 			csv_row.cbsa
	# 		end
	# 	end

	# 	attr_reader :csv_row
	# end
end
