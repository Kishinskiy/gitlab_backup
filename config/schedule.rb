require 'dotenv'
Dotenv.load

set :job_template, "/usr/bin/zsh -l -c 'source #{ENV['HOME']}/.zshrc && :job'"
job_type :run_backup, 'cd :path && ./bin/backup perform -t :task -c :config_path'

every 1.day, at: '02:00 am' do
  run_backup 'rsync_backup', config_path: "#{ENV['ROOT_PATH']}/config.rb"
end
