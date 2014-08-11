class ResumesController < ApplicationController
  def new
    resume = Resume.create!(name: "Untitled Resume")
    redirect_to edit_resume_path(resume)
  end

  def edit
    @resume = Resume.find(resume_id)
  end

  def show
    respond_to do |format|
      format.json { @resume = Resume.find(resume_id) }
      format.html { redirect_to edit_resume_path(resume_id) }
      format.pdf { @resume = Resume.find(resume_id); render layout: false }
    end
  end

  def index
    @resumes = Resume.all
  end

  def update
    @resume = Resume.find(resume_id)
    @resume.update!(
      name: params[:resume][:name],
      personal_website: params[:resume][:personal_website],
      first_name: params[:resume][:first_name],
      last_name: params[:resume][:last_name],
      phone: params[:resume][:phone],
      email: params[:resume][:email],

      # See https://github.com/rails/rails/issues/13420 .
      # Basically, the whole Array#compact thing is needed so that
      # users can clear out the jobs/educations.
      job_ids: Array(params[:resume][:job_ids]).compact,
      education_ids: Array(params[:resume][:education_ids]).compact
    )
    head :ok
  end

  private

  def resume_id
    params[:id]
  end
end
