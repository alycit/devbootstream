class ModifiyNameAndIdentifier < ActiveRecord::Migration
  def change
    change_column :resources, :user_name, :string
    change_column :resources, :identifier, :string
  end
end
