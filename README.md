# Gitlab Backup
Automatic backup GitLab-projects using `rsync` and notification via HipChat.

## Getting started

Clone the project and install depending:

    $ git clone git@github.com:mgrachev/gitlab_backup.git ~/gitlab_backup
    $ cd ~/gitlab_backup
    $ bundle install

Rename `.env.example` in `.env` and edit it:

    $ mv .env.example .env

Give permission to perform `bin/backup`:

    $ chmod +x bin/backup

Starting backup:

    $ bin/backup perform -t rsync_backup -r ~/gitlab_backup

Edit `config/schedule.rb` and update crontab:

    $ whenever --update-crontab

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
