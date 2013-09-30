class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_charset
  before_filter :configure_charsets

  before_filter :set_locale

  # 解决MySQL中文乱码
  def set_charset
    headers["Content-Type"] = "text/html;charset=utf-8"
  end

  def configure_charsets
    response.headers["Content-Type"] = "text/html;charset=utf-8"
    suppress(ActiveRecord::StatementInvalid) do
      ActiveRecord::Base.connection.execute 'SET NAMES UTF8'
    end
  end

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.available_locales = ["zh", "en"]
    I18n.locale = params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale  }
  end

  # # Get locale from top-level domain or return nil if such locale is not available
  # # You have to put something like:
  # #   127.0.0.1 application.com
  # #   127.0.0.1 application.it
  # #   127.0.0.1 application.pl
  # # in your /etc/hosts file to try this out locally
  # def extract_locale_from_tld
  #   parsed_locale = request.host.split('.').last
  #   I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
  # end

  # # Get locale code from request subdomain(like http://it.application.local:3000
  # # You have to put something like:
  # #   127.0.0.1 gr.application.local
  # # in your /etc/hosts file to try this out locally
  # def extract_locale_from_subdomain
  #   parsed_locale = request.subdomains.first
  #   I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
  # end
end
