module Api
	module V1
		class RepliesController < Api::V1::ApplicationController
			def index
				begin
					signature = params[:signature]
					timestamp = params[:timestamp]
					nonce = params[:nonce]
					echostr = params[:echostr]
					#no safe,need to save as env variable
					token = Rails.application.secrets.WX_TOKEN
					hashcode = Digest::SHA1.hexdigest [token, timestamp, nonce].sort.join
					if hashcode == signature
						render plain: echostr and return 
					else
						render plain: 'params errors' and return 
					end
				rescue 
					render plain: 'server errors' and return
				end
			end
		end
	end 
end