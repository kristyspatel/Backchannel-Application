class AddIndexToUsersUnityId < ActiveRecord::Migration
  def change
    add_index :users,:unity_id, unique:true
  end
end
