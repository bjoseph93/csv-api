class CreateZipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_codes do |t|
    	t.integer :zip, null: false
    	t.integer :cbsa
    	t.text    :msa
    	t.text    :lsad
    	t.integer :population_2015
    	t.integer :population_2014
    	t.timestamps
    end
  end
end
