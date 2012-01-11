class RemoveStripeCustomerTokenFromAdditions < ActiveRecord::Migration
  def up
    remove_column :additions, :stripe_customer_token
  end

  def down
    add_column :additions, :stripe_customer_token, :string
  end
end
