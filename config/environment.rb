# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when 
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5'

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence those specified here
  
  # Skip frameworks you're not going to use
  config.frameworks -= [ :action_web_service, :action_mailer ]
  
  config.gem 'paperclip'
  config.gem "aws-s3", :lib => "aws/s3"
  
  config.action_controller.session = { :session_key => "_ceag_session", :secret => "feddc2b86efd1ab55102c9c64a12940718b9f6e0ef1d7792acf5dd651dff56bcc5ee3fc90de670394932fd8c0cf90595456c5d19f97b42bbae3fc4058b7441b5" }
end

# Add new inflection rules using the following format 
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
   inflect.uncountable %w( kontaktpersoner )
end

