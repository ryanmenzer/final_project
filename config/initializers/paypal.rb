PayPal::Recurring.configure do |config|
	config.sandbox = true
  config.username = ENV['config.username'] 
  config.password = ENV['config.password']
  config.signature = ENV['config.signature']

end