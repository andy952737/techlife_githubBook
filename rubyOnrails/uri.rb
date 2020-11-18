
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

io = File.new("ruby.rb", "w")
io = File.open("/home/work/ruby.rb")
io.close
io.closed? #檢查是否關閉
#若後面沒有 block (結束會自動關閉) 必須要再加上，io.close，關閉檔案，否則會出錯

# https://mgleon08.github.io/blog/2016/01/31/ruby-file-dir/

