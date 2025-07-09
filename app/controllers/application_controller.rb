class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_locale

  private

  def set_locale
    if cookies.signed[:locale].nil? && request.path != language_path
      redirect_to language_path and return
    else
      I18n.locale = cookies.signed[:locale] || I18n.default_locale
    end
  end
end
