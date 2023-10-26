require 'zip'

img1 = "1.jpg"
img2 = "2.jpg" 
img3 = "3.jpg"  
images = [img1, img2, img3]
 
fils = "scene_images_zip.zip"
puts "檔案開啟Ok"  

zipfile_name = "scene_images.zip"
puts "建立壓縮檔Ok" 

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zip_file|
	images.each do |filename|    
    zip_file.add(File.basename(filename),filename) 
    #zip_file.add(File.basename(filename),"public/#{filename}")
  end
end 
   
file = File.open(zipfile_name)
# self.scene_images_zip = file
# self.scene_images_zip_size = file.pano_size
# self.save  
puts file   
puts "打開檔案Ok"

# note
# FileUtils.mkdir_p()
#zip_file.add(File.basename(img),"s/#{img}")
# zip_file.each do |entry|     
#     zip_file.add(File.basename(entry),entry)
# #   # Extract to file/directory/symlink
# #   #puts "Extracting #{entry.name}"
# #   #entry.extract('here')
# #   #zipfile.add(File.basename(filename),"public#{filename}")
# #   # Read into memory
# #   #content = entry.get_input_stream.read
# end 