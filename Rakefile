task :install do
  Rake::Task['dotfiles'].invoke
  Rake::Task['brew'].invoke
  Rake::Task['vim_plugins'].invoke
  Rake::Task['karabiner'].invoke
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

task :brew do
  `brew bundle`
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

task :karabiner do
  home = File.expand_path('~')
  target = File.join(home, '.config/karabiner/assets/complex_modifications', 'custom-capslock.json')

  if File.exists?(target)
    print "#{target} exists"
    next
  end

  File.symlink(File.join(home, 'dotfiles', 'custom-capslock.json'), target)
end
