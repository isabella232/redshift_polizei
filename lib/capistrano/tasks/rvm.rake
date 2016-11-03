namespace :rvm do
  #
  # This task will set the ruby version based on the .ruby-version and .ruby_gemset files
  #
  task :set_ruby_version do
    # It relies on the ENV['GEM_HOME'] to fetch the ruby version
    set :rvm_ruby_version, File.basename(ENV['GEM_HOME'])
  end
end
