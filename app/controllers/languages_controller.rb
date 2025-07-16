class LanguagesController < ApplicationController
    skip_before_action :set_locale, only: [ :set ]

    def set
        locale = params[:locale].to_sym

        # Check if the locale is in our list of available locales
        if I18n.available_locales.include?(locale)
            # Set a permanent, signed cookie.
            # 'permanent' makes it last 20 years (effectively "never" expires).
            # 'signed' encrypts it so the user can't tamper with it.
            cookies.permanent.signed[:locale] = locale
        end

    # Redirect the user back to the page they were on
    redirect_to root_path
    end

    def show
        @skip_layout_body = true
        cookies.delete(:locale)
    end
end
