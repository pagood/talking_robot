class TextMessage
	# ToUserName	是	接收方帐号（收到的OpenID）
	# FromUserName	是	开发者微信号
	# CreateTime	是	消息创建时间 （整型）
	# MsgType	是	text
	# Content
	attr_accessor :to_user_name
	attr_accessor :from_user_name
	attr_accessor :create_time
	attr_accessor :msg_type
	attr_accessor :content
	def initialize to_user, from_user, content
		self.create_time = Time.now.to_i
		self.msg_type = 'text'
		#TODO
		self.content = '美滋滋'
		#my wechat account 
		self.to_user_name = to_user
		self.from_user_name = from_user
	end

	def to_hash
		instance_hash = {}
		self.instance_variables.each do |var| 
			instance_hash[var.to_s.delete("@").classify] = self.instance_variable_get(var) 
		end
		instance_hash
	end

	def to_xml
		self.to_hash.to_xml({root: 'xml', skip_types: true})
	end
end