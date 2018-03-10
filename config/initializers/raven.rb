Raven.configure do |config|
  config.dsn = ENV['SENTRY_URL']
  config.environments = ['production']
end
