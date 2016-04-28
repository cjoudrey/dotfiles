task :install do
  Rake::Task['dotfiles'].invoke
  Rake::Task['vim_plugins'].invoke
end

task :dotfiles => [:update_submodules] do
  root = File.expand_path(".")
  target = File.expand_path("~")
  File.read('Manifest').each_line do |file|
    file = file.chomp
    target_file = "#{target}/.#{file}"

    if File.exists?(target_file)
      print "Skipping #{file} - #{target_file} exists\n"
      next
    end

    print "Installing #{file}\n"
    File.symlink("#{root}/#{file}", target_file)
  end
end

task :update_submodules do
  print "Updating git submodules\n"
  `git submodule init`
  `git submodule update`
end

task :vim_plugins do
  print "Installing vim plugins\n"
  `vim +PluginInstall +qall`
end
