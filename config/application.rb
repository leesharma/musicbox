require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Musicbox
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # Use JSON exceptions
    config.exceptions_app = self.routes

    # Disable unneeded generators
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.test_framework :test_unit, fixture: false
      generate.template_engine false
    end
  end
end
