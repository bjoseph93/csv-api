class ZipCodesController < ApplicationController
	before_action :ensure_zip

	def zip_code
		@zip_codes = ZipCode.where(zip: zip_params)
		render "../views/zip_codes.json.jbuilder"
	end

	private

	def zip_params
		params.require(:zip)
	end

	def ensure_zip
		if params[:zip].nil?
			render json: "Missing required parameter 'zip'.", status: 400
		elsif params[:zip].to_i == 0
			render json: "Parameter 'zip' must be an integer.", status: 422
		end
			
	end
end