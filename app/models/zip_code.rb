class ZipCode < ApplicationRecord
	validates :zip, presence: true
end
