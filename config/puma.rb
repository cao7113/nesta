app_root = File.expand_path('../..', __FILE__)

puts app_root

directory app_root

bind "unix://#{app_root}/tmp/puma.sock"
