namespace :assets do
  desc 'Migrate the database'
  task :compile do
    on roles(:db) do
      within release_path do
        with rack_env: fetch(:rack_env) do
          execute :bundle, :exec, :rake, 'assets:clean'
          execute :bundle, :exec, :rake, 'assets:compile'
        end
      end
    end
  end
end
