template "/tmp/test_file_from_itamae" do
  source "test_file_from_itamae.erb"
end

execute "hello" do
  command "echo hello"
end
