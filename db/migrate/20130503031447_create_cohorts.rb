class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name, :null=>false
      t.date :start_date, :null=>false
      t.date :end_date, :null=>false

      t.timestamps
    end
  end
end
