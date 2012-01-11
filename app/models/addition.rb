class Addition < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :amount

  
  def payment(user,amount)
    if valid?
      customer = Stripe::Customer.retrieve(user.stripe_id)
      Stripe::Charge.create(:amount => amount.cents, :currency => "usd", :customer => customer.id)
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
