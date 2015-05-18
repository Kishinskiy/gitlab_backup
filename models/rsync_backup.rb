# encoding: utf-8

require 'dotenv'
Dotenv.load

Model.new(:rsync_backup, 'Rsync backup') do
  before do
    system('sudo gitlab-rake gitlab:backup:create')
  end

  sync_with RSync::Push do |rsync|
    rsync.directories do |directory|
      directory.add '/etc/gitlab'
      directory.add '/var/opt/gitlab/backups'
    end
  end

  compress_with Gzip

  notify_by Hipchat
end
