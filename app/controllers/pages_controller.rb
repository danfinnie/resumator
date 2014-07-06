class PagesController < ApplicationController
  def home
    @resumes = Resume.order(:name)
  end
end
