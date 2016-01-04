class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.float :amount
      t.string :name
      t.string :stripe_plan_id
      t.string :interval
      t.text :features

      t.timestamps null: false
    end
  end
end
