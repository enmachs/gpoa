require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InyxmaterRails
  # Application
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over
    #   those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Enable the asset pipeline
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    # Set Time.zone default to the specified zone and make Active Record
    #   auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    #   Default is UTC.
    config.time_zone = 'Caracas'

    # The default locale is :en and all translations from config/locales/*.rb,
    #   yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join(
      'plugins',
      'locales',
      '*.{rb,yml}'
    ).to_s]

    I18n.available_locales = [:en, :es]

    config.i18n.default_locale = :en

    config.active_record.raise_in_transactional_callbacks = true

    # config exeption routes
    config.exceptions_app = routes
  end
end
