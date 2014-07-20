describe "creating a user with a basic profile" do
  it "is amazing" do
    Given 'I am on the homepage'
    When 'I make a job about Animal Control'
    Then 'I see a success message'

    Given 'I am on the homepage'
    When 'I make an education about Pet Mind Control'
    Then 'I see a success message'
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
    fill_in 'Description', with: <<-EOT
      * Herded cats
      * Pet dogs
      * Fed dogs
    EOT

    click_on 'Create Job'
  end

  def i_see_a_success_message
    expect(page).to have_content('Job was successfully created.')
  end
end
