json.zip_entries @zip_codes.each do |zip_code|
	json.partial! './zip_code', zip_code: zip_code
end