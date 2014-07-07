class AddMetadataToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :personal_website, :string
    add_column :resumes, :email, :string
    add_column :resumes, :phone, :string
    add_column :resumes, :first_name, :string
    add_column :resumes, :last_name, :string
  end
end
