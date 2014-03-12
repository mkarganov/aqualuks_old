rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///home/deploy/shared/server/aqualuks-puma.sock"
pidfile "/home/deploy/shared/server/pid"
state_path "/home/deploy/shared/server/state"

activate_control_app
