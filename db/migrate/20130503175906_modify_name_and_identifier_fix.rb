class ModifyNameAndIdentifierFix < ActiveRecord::Migration
  def change
    change_column :resources, :user_name, :string, :null=>true
    change_column :resources, :identifier, :string, :null=>true
  end
end
