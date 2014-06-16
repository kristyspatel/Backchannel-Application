class AlterLastVisitedInUser < ActiveRecord::Migration
 def change
   change_column :users, :last_visited, :datetime, :default => Time.now
 end
end
