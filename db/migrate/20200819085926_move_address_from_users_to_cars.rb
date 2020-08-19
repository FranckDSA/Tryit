class MoveAddressFromUsersToCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :address
    add_column :cars, :address, :string
  end
end
