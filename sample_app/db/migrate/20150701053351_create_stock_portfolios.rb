class CreateStockPortfolios < ActiveRecord::Migration
  def change
    create_table :stock_portfolios do |t|
      t.integer :stockOwned
      t.integer :portfolio_id
      t.integer :stock_id

      t.timestamps null: false
    end
  end
end
