class CreateUserposts < ActiveRecord::Migration
  def change
    create_table :userposts do |t|
      t.text :context
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
