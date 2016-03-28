set :deploy_to, "/home/ubuntu/lipans/staging"
server '54.254.141.91', user: 'ubuntu', roles: %w{web app db}, ssh_options: {port: 22, password: '123'}

set :rails_env, :staging
set :conditionally_migrate, true