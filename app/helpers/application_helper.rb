module ApplicationHelper
  def lesc(text)
    LatexToPdf.escape_latex(text)
  end

  def dotted_phone_number orig
    no_letters_allowed = orig.to_s.scan(/\d/).join
    [0..2, 3..5, 6..10].map { |range| no_letters_allowed[range] }.join("-")
  end

  def navbar_item name, path, alt_path = nil
    class_name = (current_page?(path) || (alt_path && current_page?(alt_path))) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to name, path
    end
  end
end
