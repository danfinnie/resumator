describe "creating a user with a basic profile" do
  it "lets users make HTML and PDF resumes" do
    Given 'I am on the homepage'
    And 'I modify my experience'
    And 'I make a job about Animal Control'
    And 'I make an education about Mind Control'
    When 'I am on the homepage'
    And 'I create a resume'
    And 'I select my jobs, experiences, and metadata'
    Then 'I see an HTML version of my resume'
    And 'I see a PDF version of my resume'

    When 'I reload the page'
    Then 'My jobs and experiences are still selected'
  end

  def i_am_on_the_homepage
    visit '/'
  end

  def i_modify_my_experience
    click_on 'Edit My Experience'
  end

  def i_make_a_job_about_animal_control
    within ".jobs" do
      click_on 'Add'
      fill_in 'Started', with: '2010-08-01'
      fill_in 'Ended', with: '2011-08-01'
      fill_in 'Title', with: 'Animal Control Specialist'
      fill_in 'Place', with: 'Department of Control'
      fill_in 'Location', with: 'San Bruno, CA'
      fill_in 'Description', with: <<-EOT.strip_heredoc
        * Herded cats
        * Pet dogs
        * Fed dogs
      EOT

      click_on 'Save'
    end
  end

  def i_make_an_education_about_mind_control
    within ".educations" do
      click_on 'Add'
      fill_in 'Obtained', with: '2009-06-01'
      fill_in 'Title', with: 'Mind Control'
      fill_in 'Place', with: 'Lehigh University'
      fill_in 'Location', with: 'Area 51'
      fill_in 'GPA', with: '3.5'
      fill_in 'Description', with: <<-EOT.strip_heredoc
      * List of the Deans
      * Lehigh Liner
      EOT
      click_on 'Save'
    end
  end

  def i_create_a_resume
    click_on 'Create a Resume'
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
    expect(page).to have_css('.resume-preview .education', text: 'Area 51')
    expect(page).to have_css('.resume-preview .education', text: 'June 2009')
    expect(page).to have_css('.resume-preview .education li', text: 'List of the Deans')
    expect(page).to have_css('.resume-preview .education li', text: 'Lehigh Liner')
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
    expect(pdf_text).to include('Mind Control')
    expect(pdf_text).to include('LEHIGH UNIVERSITY')
    expect(pdf_text).to include('Cum. GPA: 3.5')
    expect(pdf_text).to include('Area 51')
    expect(pdf_text).to include('Jun 2009')
    expect(pdf_text).to include('Lehigh Liner')
    expect(pdf_text).to include('List of the Deans')
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

