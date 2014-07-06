class ResumesController < ApplicationController
  def new
    resume = Resume.create!(name: "Untitled Resume")
    redirect_to edit_resume_path(resume)
  end

  def edit
    @resume = Resume.find(resume_id)
  end

  def show
    @resume = Resume.find(resume_id)
  end

  def update
    # See https://github.com/rails/rails/issues/13420
    @resume = Resume.find(resume_id)
    @resume.update!(
      name: params[:resume][:name],
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
