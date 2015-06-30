class AddBalanceToUser < ActiveRecord::Migration
  def change
  	add_column :users, :balance, :integer, :limit => 8
  end
end
