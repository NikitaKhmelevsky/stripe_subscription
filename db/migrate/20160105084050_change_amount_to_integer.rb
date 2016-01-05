class ChangeAmountToInteger < ActiveRecord::Migration
  def change
    change_table :plans do |t|
      t.change :amount, :integer
    end
  end
end
