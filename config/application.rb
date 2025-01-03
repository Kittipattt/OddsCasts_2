require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Oddscasts
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])

    # Explicitly set eager load paths if needed
    config.eager_load_paths << Rails.root.join("lib")
  end
end