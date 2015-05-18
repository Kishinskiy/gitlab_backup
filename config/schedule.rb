require 'dotenv'
Dotenv.load

set :job_template, "/usr/bin/zsh -l -c 'source #{ENV['HOME']}/.zshrc && :job'"
job_type :run_backup, 'cd :path && ./bin/backup perform -t :task -r :path'

every 1.day, at: '02:00 am' do
  run_backup 'rsync_backup', path: ENV['ROOT_PATH']
end
