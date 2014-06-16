class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :unity_id
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :role
      t.datetime :last_visited

      t.timestamps
    end
  end
end
