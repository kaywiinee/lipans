Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

DEPLOY_PATH = "/home/ubuntu/lipans/production"
CURRENT_PATH = "#{DEPLOY_PATH}/current"
WORKERS = 4

worker_processes WORKERS
working_directory CURRENT_PATH
listen "#{DEPLOY_PATH}/shared/tmp/sockets/unicorn.sock", :backlog => 64
listen 8080, :tcp_nopush => true
timeout 60
pid "#{DEPLOY_PATH}/shared/tmp/pids/unicorn.pid"

stderr_path "#{DEPLOY_PATH}/shared/log/unicorn.stderr.log"
stdout_path "#{DEPLOY_PATH}/shared/log/unicorn.stdout.log"

preload_app true
GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

check_client_connection false

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{CURRENT_PATH}/Gemfile"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end

class Unicorn::HttpServer
  module MyOobGc
    def process_client(client)
      GC.disable
      super(client)
      GC.enable
      GC.start
    end
  end
  prepend MyOobGc
end
