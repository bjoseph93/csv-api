class BackfillZipCodes
	ZIP_TO_CBSA = "housing_data/zip_to_cbsa.csv"
	ZIP_HEADER_ROWS = 1
	CBSA_TO_MSA = "housing_data/cbsa_to_msa.csv"
	CBSA_HEADER_ROWS = 4

	def self.execute
		BackfillZipToCbsa.execute(CsvParser.new(ZIP_TO_CBSA, ZIP_HEADER_ROWS).array)
		BackfillCbsaToMsa.execute(CsvParser.new(CBSA_TO_MSA, CBSA_HEADER_ROWS).array)
	end
end