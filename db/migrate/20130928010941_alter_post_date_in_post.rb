class AlterPostDateInPost < ActiveRecord::Migration
  def change
    change_column :posts, :post_date, :datetime, :default => Time.now
  end
end
