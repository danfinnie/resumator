describe Resume do
  describe "associations" do
    let!(:resume) { Resume.create! }
    let!(:early_job) { Job.create!(started_at: '01-01-2000') }
    let!(:late_job) { Job.create!(started_at: '01-01-2002') }
    let!(:middle_job) { Job.create!(started_at: '01-01-2001') }
    let!(:education) { Education.create! }

    before do
      resume.experiences << late_job << early_job << middle_job << education
    end

    it "links to experiences" do
      expect(resume.experiences).to match_array [early_job, middle_job, late_job, education]
    end

    it "links to educations" do
      expect(resume.educations).to match_array [education]
    end

    it "links to jobs with the latest first" do
      expect(resume.jobs).to eq [late_job, middle_job, early_job]
    end
  end
end
