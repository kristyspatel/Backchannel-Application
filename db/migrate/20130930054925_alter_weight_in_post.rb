class AlterWeightInPost < ActiveRecord::Migration
  def change
    change_column :posts, :weight, :integer
  end
end
