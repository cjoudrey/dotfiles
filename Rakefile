task :install => [:update_submodules] do
  root = File.expand_path(".")
  target = File.expand_path("~")
  File.read('Manifest').each_line do |file|
    file = file.chomp
    print "Installing #{file}\n"
    File.symlink("#{root}/#{file}", "#{target}/.#{file}")
  end
end

task :update_submodules do
  print "Updating git submodules\n"
  `git submodule init`
  `git submodule update`
end
