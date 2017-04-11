require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blowball
  class Application < Rails::Application
    I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
    config.i18n.default_locale = :ru
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.raise_in_transactional_callbacks = true
  end
end