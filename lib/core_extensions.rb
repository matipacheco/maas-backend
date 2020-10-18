# frozen_string_literal: true

class Date
  def base_format
    strftime('%d/%M/%Y')
  end

  def week_day_format
    strftime('%A %d de %B')
  end
end
