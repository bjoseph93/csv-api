require 'csv'

class CsvParser
	def initialize(file, number_of_header_rows)
		@file = file
		@number_of_header_rows = number_of_header_rows
	end

	def array
		csv_array = CSV.read(file, encoding: "GB18030:UTF-8")
		remove_headers(csv_array)
	end

	def remove_headers(csv_array)
		csv_array.shift(number_of_header_rows)
		csv_array
	end

	private

	attr_reader :file, :number_of_header_rows
end