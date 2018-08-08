class ZipCode < ApplicationRecord
	validates :zip, presence: true

	scope :with_cbsa_and_no_msa, ->(cbsa) {
		where(cbsa: cbsa, msa: nil)
	}
end
