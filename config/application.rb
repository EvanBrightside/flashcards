require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Flashcards
  class Application < Rails::Application

    config.i18n.default_locale = :en
    config.i18n.available_locales = %w[en ru]
  end
end
