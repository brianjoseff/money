class AddAccountIdToAdditions < ActiveRecord::Migration
  def change
    add_column :additions, :account_id, :integer
  end
end
