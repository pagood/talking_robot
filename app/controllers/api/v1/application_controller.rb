module Api
	module V1
		class ApplicationController < ActionController::API
			rescue_from(Exception) do |err|
		        ####err, cannot exposed to client
		        Rails.logger.info err.class
		        Rails.logger.info err
		        Rails.logger.info err.backtrace.join("\n")
		        render json: { error: 'ServerError', message: '请求出错，请稍后重试！' }, status: 500
		      end
		end
	end
end