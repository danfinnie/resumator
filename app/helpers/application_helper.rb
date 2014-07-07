module ApplicationHelper
  def lesc(text)
      LatexToPdf.escape_latex(text)
  end

  def dotted_phone_number orig
    no_letters_allowed = orig.to_s.scan(/\d/).join
    [0..2, 3..5, 6..10].map { |range| no_letters_allowed[range] }.join("-")
  end
end
