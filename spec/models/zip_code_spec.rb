require 'rails_helper'

RSpec.describe ZipCode, type: :model do
	it "validates zip" do
		zip_code = ZipCode.new
		zip_code.valid?
		expect(zip_code.errors[:zip].size).to eq(1)
	end
end
