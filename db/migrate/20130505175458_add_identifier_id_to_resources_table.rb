class AddIdentifierIdToResourcesTable < ActiveRecord::Migration
  def change
    add_column :resources, :identifier_id, :integer
  end
end
