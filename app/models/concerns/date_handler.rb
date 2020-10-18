module DateHandler
  extend ActiveSupport::Concern

  def format_date(date, date_format = :default, locale = :es)
    I18n.l(date, format: date_format, locale: locale)
  end
end
