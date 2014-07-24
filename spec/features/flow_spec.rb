describe "creating a user with a basic profile" do
  it "lets users make HTML and PDF resumes" do
    Given 'I am on the homepage'
    When 'I make a job about Animal Control'
    Then 'I see a success message'

    Given 'I am on the homepage'
    When 'I make an education about Mind Control'
    Then 'I see a success message'

    Given 'I am on the homepage'
    When 'I create a resume'
    And 'I select my jobs, experiences, and metadata'
    Then 'I see an HTML version of my resume'
    And 'I see a PDF version of my resume'

    When 'I reload the page'
    Then 'My jobs and experiences are still selected'
  end

  def i_am_on_the_homepage
    visit '/'
  end

  def i_make_a_job_about_animal_control
    click_on 'add some of your experience'
    fill_in_date 'job_started', with: '2010 August 1st'
    fill_in_date 'job_ended', with: '2011 August 1st'
    fill_in 'Title', with: 'Animal Control Specialist'
    fill_in 'Place', with: 'Department of Control'
    fill_in 'Location', with: 'San Bruno, CA'
    fill_in 'Description', with: <<-EOT.strip_heredoc
      * Herded cats
      * Pet dogs
      * Fed dogs
    EOT

    click_on 'Create Job'
  end

  def i_see_a_success_message
    expect(page).to have_content('was successfully created.')
  end

  def i_make_an_education_about_mind_control
    click_on 'education'
    fill_in_date 'education_obtained_at', with: 'June 2009'
    fill_in 'Title', with: 'Mind Control'
    fill_in 'Place', with: 'Lehigh University'
    fill_in 'Gpa', with: '3.5'
    fill_in 'Description', with: <<-EOT.strip_heredoc
     * The hill
     * Trained mind rays to influence
       large animals without exposing
      rodent-sized creatures to excess
      radiation
    EOT
    click_on 'Create Education'
  end

  def i_create_a_resume
    click_on 'create a resume'
  end

  def i_select_my_jobs_experiences_and_metadata
    fill_in "First name", with: "Chelsea"
    fill_in "Last name", with: "Radcliffe"
    fill_in "Email", with: "chelsea.radcliffe@gmail.com"
    fill_in "Personal Website", with: "radcliffe43.geocities.com"
    fill_in "Phone", with: "303 555 6263"
    check "Mind Control at Lehigh University"
    check "Animal Control Specialist at Department of Control"
  end

  def i_see_an_html_version_of_my_resume
    expect(page).to have_css('.resume-preview .education', text: 'Mind Control from Lehigh University (3.5 GPA)')
    expect(page).to have_css('.resume-preview .education', text: 'June 2009')
    expect(page).to have_css('.resume-preview .education li', text: 'The hill')
    expect(page).to have_css('.resume-preview .education li', text: 'Trained mind rays')
    expect(page).to have_css('.resume-preview .experience', text: 'Animal Control Specialist at Department of Control')
    expect(page).to have_css('.resume-preview .experience', text: 'August 2010')
    expect(page).to have_css('.resume-preview .experience', text: 'August 2011')
    expect(page).to have_css('.resume-preview .experience li', text: 'Herded cats')
    expect(page).to have_css('.resume-preview .experience li', text: 'Pet dogs')
    expect(page).to have_css('.resume-preview .experience li', text: 'Fed dogs')
  end

  def i_see_a_pdf_version_of_my_resume
    pdf_url = page.driver.evaluate_script('window.location.origin + $("object").attr("data")')
    pdf_text = extract_pdf_text(pdf_url)

    expect(pdf_text).to include('Chelsea Radcliffe')
    expect(pdf_text).to include('radcliffe43.geocities.com')
    expect(pdf_text).to include('303-555-6263')
    # expect(pdf_text).to include('Mind Control from Lehigh University (3.5 GPA)')
    # expect(pdf_text).to include('June 2009')
    # expect(pdf_text).to include('The hill')
    # expect(pdf_text).to include('Trained mind rays')
    expect(pdf_text).to include('DEPARTMENT OF CONTROL')
    expect(pdf_text).to include('San Bruno, CA')
    expect(pdf_text).to include('August 2010')
    expect(pdf_text).to include('August 2011')
    expect(pdf_text).to include('Herded cats')
    expect(pdf_text).to include('Pet dogs')
    expect(pdf_text).to include('Fed dogs')
  end

  def i_reload_the_page
    visit current_path
  end

  def my_jobs_and_experiences_are_still_selected
    within "label", text: "Mind Control at Lehigh University" do
      expect(page.find('input')).to be_checked
    end

    within "label", text: "Animal Control Specialist at Department of Control" do
      expect(page.find('input')).to be_checked
    end
  end

end

