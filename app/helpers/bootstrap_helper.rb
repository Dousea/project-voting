# frozen_string_literal: true

module BootstrapHelper
  def bootstrap_flash_color(type)
    case type.to_sym
    when :alert
      'danger'
    when :notice
      'info'
    else
      'info'
    end
  end
end
