class AddWeightToPost < ActiveRecord::Migration
  def change
    add_column :posts,:weight, :string
  end
end
