require_relative 'helpers/extract_pdf_text'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  binary = Rails.root.join('junk').join('phantomjs').to_s
  Capybara::Poltergeist::Driver.new(app, phantomjs: binary)
end

Capybara.default_driver = :poltergeist

RSpec.configure do |config|
  config.include ExtractPdfText

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
