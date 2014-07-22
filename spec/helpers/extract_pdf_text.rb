require 'open3'

module ExtractPdfText
  def extract_pdf_text(pdf_url)
    pdf_text, stderr, status = Open3.capture3("curl '#{pdf_url}' | tee junk/test_output.pdf | pdftotext - -")

    unless status.exitstatus.zero?
      raise "Curl or pdftotext failed with code #{status.exitstatus}:\n#{stderr}"
    end

    pdf_text
  end
end
