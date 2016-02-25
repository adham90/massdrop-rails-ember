require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    ActiveModel::Serializer.config.adapter = :json

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*',
        :headers => :any,
        :expose => ['X-User-Authentication-Token', 'X-User-Id'],
        :methods => [:get, :post, :options, :patch, :delete]
      end
    end
  end
end
