module Api
	module V1
		class RepliesController < Api::V1::ApplicationController
			def index
				render json: {msg: 'hello'}
			end
		end
	end 
end