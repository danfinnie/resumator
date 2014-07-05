class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.date :started
      t.date :ended
      t.string :title
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
