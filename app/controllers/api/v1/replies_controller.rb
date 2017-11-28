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

			def create
				# doc = Nokogiri::XML(request.body.read)
				# puts doc.child
				params = Hash.from_xml(request.body.read)['xml']
				#TODO log message
				to_user = params['FromUserName']
        from_user = params['ToUserName']
        content = params['Content']
				case params['MsgType']
				when 'text'
					reply = TextMessage.new(to_user, from_user, content)
					render plain: reply.to_xml and return
				else
				#TODO other types message
					render plain: 'success' and return 
				end
			end
		end
	end 
end

