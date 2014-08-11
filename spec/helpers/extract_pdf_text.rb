require 'open3'
require 'net/http'

module ExtractPdfText
  def extract_pdf_text(pdf_url)
    response = Net::HTTP.get_response(URI(pdf_url))

    pdf_data = response.read_body
    encoding = response.type_params["charset"]
    pdf_data.force_encoding(encoding) if encoding

    if response.code.to_i >= 400
      raise "Failure when downloading PDF at #{pdf_url}:\nHTTP #{response.code} #{response.message}\n#{pdf_data}"
    end

    pdf_text, stderr, status = Open3.capture3("pdftotext - -", stdin_data: pdf_data)

    unless status.exitstatus.try(:zero?)
      raise "Curl or pdftotext failed with code #{status.exitstatus}:\n#{stderr}"
    end

    pdf_text
  end
end
