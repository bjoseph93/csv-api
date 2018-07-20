class ZipCodesController < ApplicationController
	before_action :ensure_zip

	def zip_code

		# @all_zip_codes = ZipCode.all_cached

		@zip_codes = ZipCode.where(zip: zip_params)
		# render json: "Need zip", status: :bad_request

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