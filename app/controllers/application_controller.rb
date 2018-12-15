class ApplicationController < ActionController::Base
  config.time_zone = 'Moscow'
  I18n.config.available_locales = :ru
  I18n.config.default_locale = :ru
end
