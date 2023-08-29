# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

## Didn't work:
# config.action_mailer.raise_delivery_errors = true
# config.action_mailer.default_url_options = { host: ‘localhost:3000’, protocol: ‘http’ }
# config.action_mailer.perform_deliveries = true
# config.action_mailer.default :charset => “utf-8”
# config.action_mailer.delivery_method = :smtp
# config.action_mailer.smtp_settings = {
# address: ‘smtp.gmail.com’,
# port: 587,
# user_name: Rails.application.credentials.smtp[:SMTP_USERNAME],
# password: Rails.application.credentials.smtp[:SMTP_PASSWORD],
# authentication: :plain,
# enable_starttls_auto: true
# }