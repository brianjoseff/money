class CreateAdditions < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.integer :amount_id
      t.integer :user_id
      t.string :stripe_customer_token

      t.timestamps
    end
  end
end
