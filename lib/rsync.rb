# encoding: utf-8

require 'backup'

module Backup
  module Syncer
    module RSync
      class Push
        attr_accessor :use_sudo

        private

        def rsync_command
          command = (super << compress_option << password_option << transport_options)
          command = "#{utility(:sudo)} #{command}" if use_sudo
          command
        end
      end
    end
  end
end
