if ENV['RAILS_ENV'] == 'production'
	# Change to match your CPU core count
	workers 1

	# Min and Max threads per worker
	threads 1, 6

	app_dir = '/var/www/talking_robot/shared'
	shared_dir = "#{app_dir}/tmp"

	# Default to production
	rails_env = ENV['RAILS_ENV'] || "production"
	environment rails_env

	# Set up socket location
	bind "unix://#{shared_dir}/sockets/puma.sock"

	# Logging
	stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

	# Set master PID and state locations
	pidfile "#{shared_dir}/pids/puma.pid"
	state_path "#{shared_dir}/pids/puma.state"
	activate_control_app
end