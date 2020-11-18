
# s3 
uri = URI(url_to_s3)
response = Net::HTTP.get_response(uri)
File.open(filename, 'wb'){|f| f.write(response.body)}

File.open('filename', 'wb') do |file|
  reap = s3.get_object({ bucket:'bucket-name', key:'object-key' }, target: file)
end
# https://aws.amazon.com/tw/blogs/developer/downloading-objects-from-amazon-s3-using-the-aws-sdk-for-ruby/

 
#ruby for linux
system "ls -la"
system "mv"
system "rm -rf" 
system "mkdir -R"
FileUtils.rm_rf(tmp_path) if File.directory?(tmp_path)
FileUtils.mkdir_p(tmp_path) 
