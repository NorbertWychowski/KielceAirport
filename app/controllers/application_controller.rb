class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] unless params[:locale].nil?
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def not_found
    respond_to do |format|
      format.html {render file: "#{Rails.root}/public/404", layout: false, status: :not_found}
      format.xml {head :not_found}
      format.any {head :not_found}
    end
  end
end
