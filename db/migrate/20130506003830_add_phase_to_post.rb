class AddPhaseToPost < ActiveRecord::Migration
  def up
    add_column :posts, :phase_id, :integer, :null=>true
  end
  def down
    remove_column :posts, :phase_id
  end
end
