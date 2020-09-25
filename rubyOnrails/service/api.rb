module Api  
	# 與他人串接API設計的流程：
	# 1.與對方溝通，確認需搖什麼以及跟對方要api_key.yml
	# 2.寫api service 以及 api測試對接文件，設計Model
	# 3.send build_demo  

	def self.get_demo(option) 
		_get_demo(option)
	end 
 
	private

	def self._get_demo(option)  
		url = store_url 
		r = call_api(url, {  
			api_Key: api_key,
			demo_id: option[:demo_id]
		})  
		if r[:result] == 1
			r[:demo_name] = r[:demo_response]["demo_name"]
			#...
		end
		r 
	end

	def self.api_key
		Rails.application.config_for(:api_key)['tp']['demo']['api']['key']
	end

	def self.call_api(url, data={}) 
		Rails.logger.info "post_to_chyi_server"
		Rails.logger.info " url: #{url}"  
		Rails.logger.info " data: #{data}"
 
  		uri = URI.parse(url) 
  		rst = Net::HTTP.post_form(uri, data)   
		Rails.logger.info "response_http_code: #{rst.code}" 
		Rails.logger.info "result: #{rst.body}"    

		if rst.code.to_i != 200
			return {
				:result => 0,
				:message => "#{rst.code}/#{data}"
			}
		end

		b = rst.body.gsub("\t","") #\t 無法被 json parse
		body = JSON.parse(b) rescue {}
		if body["result"].present?
			if body["result"] == 1
				result = {
					:result => 1,
					:chyi_response => body
				}
			else
				result = {
					:result => 0,
					:message => body["message"],
					:chyi_response => body
				}
			end
		else 
			result = {
				:result => 0,
				:message => "parse fail",
				:body => rst.body
			}
		end
	end


end