class BackfillZipCodes < ActiveRecord::Migration[5.2]
  def up
  	BackfillZipCodes.execute
  end
end
