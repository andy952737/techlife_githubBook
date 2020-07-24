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