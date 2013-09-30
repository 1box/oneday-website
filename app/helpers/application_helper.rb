module ApplicationHelper

  def full_title(page_title)
    base_title = t(:one_day_base_title)
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def markdown(text)
    options = {   
      :autolink => true, 
      # :space_after_headers => true,
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :hard_wrap => true,
      :strikethrough =>true
    }
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay, options)
    markdown.render(h(text)).html_safe
  end

  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end

  # include WillPaginate::ViewHelpers

  # def will_paginate_with_i18n(collection, options = {})
  #   will_paginate_without_i18n(collection, options.merge(previous_label: I18n.t(:previous_label), next_label: I18n.t(:next_label)))
  # end

  # alias_method_chain :will_paginate, :i18n
end

