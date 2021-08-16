# frozen_string_literal: true

module ApplicationHelper
  include AssetsHelper
  include BootstrapHelper
  include FeatherHelper

  def navbar_link_content(icon, text)
    tag.i(class: 'me-1', 'data-feather': icon) +
      tag.span(text, class: 'd-none d-md-inline-block')
  end

  def navbar_link(icon, text, path, **options)
    link_to navbar_link_content(icon, text), path, options.merge!(class: 'link-light text-decoration-none')
  end

  def navbar_link_unless(condition, icon, text, path, **options)
    if condition
      tag.div navbar_link_content(icon, text), class: 'text-light opacity-75'
    else
      navbar_link(icon, text, path, **options)
    end
  end
end
