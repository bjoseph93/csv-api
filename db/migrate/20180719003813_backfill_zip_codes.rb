class BackfillZipCodes < ActiveRecord::Migration[5.2]
	require 'backfill_zip_codes'

	def up
		BackfillZipCodes.execute
	end
end
