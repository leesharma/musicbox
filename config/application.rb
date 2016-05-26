require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Musicbox
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |generate|
      generate.helpers false
      generate.assets false
    end
  end
end
