#刪除重複的資料
def delete_repeat_objects_date     
	key_counts = Model.group(:_id).count
	ids = key_counts.select{|id, count| count > 1}.keys
	total = 0 
	ids.each do |id|
	    objs = Model.where(_id: id) 
		objs.each_with_index do |a, i|
		   puts "#{a.id} - #{i}"    
		   if i > 0
		    a.delete  
		   end         
		end   
	total += 1
	end        
	r = {  
		message: "總移除：#{total} 個物件" 
	} 
end


def delete_repeat_object_date2 
	  [ 
			{class_model: Model, key: :tp_id, title: "Test"},
			#{class_model: Tp::Chyi::Object, key: :tp_id, title: "群義房屋"}, 
			#{class_model: Tp::Hbhousing::Object, key: :tp_id, title: "住商/大家房屋"},
			#{class_model: Twhg::Object, key: :twhg_object_id, title: "台灣房屋"},
		].each do |a|
	   		id_counts = a[:class_model].group(a[:key]).count 
			ids = id_counts.select{|id, count| count > 1}.keys
			ids.each do |id| 
			    objs = a[:class_model].where(a[:key] => id) 
				objs.each_with_index do |a, i| 
				   if i > 0 
				    a.delete  
				   end        
				end    
			end  
		end
end