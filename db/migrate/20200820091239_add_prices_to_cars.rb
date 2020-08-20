class AddPricesToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :sell_price, :integer
    add_column :cars, :daily_rent_price, :integer
  end
end
