class RenameJobStartedAndEndedToHaveAtSuffix < ActiveRecord::Migration
  def change
    rename_column :jobs, :started, :started_at
    rename_column :jobs, :ended, :ended_at
  end
end
