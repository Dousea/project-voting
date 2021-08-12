# frozen_string_literal: true

module FeatherHelper
  def feather_flash_icon(type)
    case type.to_sym
    when :alert
      'alert-triangle'
    when :notice
      'info'
    else
      'info'
    end
  end
end
