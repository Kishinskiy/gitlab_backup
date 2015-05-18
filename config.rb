# encoding: utf-8
# Backup v4.x Configuration
require 'dotenv'
Dotenv.load

root_path ENV['ROOT_PATH']
tmp_path  'tmp'
data_path 'data'

Syncer::RSync::Push.defaults do |rsync|
  rsync.use_sudo = true
  rsync.mode = :ssh
  rsync.host = ENV['RSYNC_HOST']
  rsync.port = 22
  rsync.ssh_user = ENV['RSYNC_SSH_USER']
  rsync.additional_ssh_options = "-i '#{ENV['HOME']}/.ssh/id_rsa'"
  rsync.mirror   = true
  rsync.compress = true
  rsync.path = ENV['RSYNC_PATH']
end

Compressor::Gzip.defaults do |compression|
  compression.level = 6
  compression.rsyncable = true
end

Notifier::Hipchat.defaults do |hipchat|
  hipchat.on_success = true
  hipchat.on_warning = true
  hipchat.on_failure = true

  hipchat.success_color = 'green'
  hipchat.warning_color = 'yellow'
  hipchat.failure_color = 'red'

  hipchat.token = ENV['HIPCHAT_TOKEN']
  hipchat.from = 'Backup'
  hipchat.rooms_notified = ENV['HIPCHAT_ROOMS'].split(',').collect(&:strip)
end
