class User < ActiveRecord::Base
  include Clearance::User
  attr_accessor :stripe_card_token
  before_save :update_stripe
  
  has_many :additions
  has_one :account
  
  def update_stripe
    if stripe_card_token.present?
      if stripe_id.nil?
        customer = Stripe::Customer.create(
          :description => email,
          :card => stripe_card_token
        )
#         self.last_4_digits = customer.active_card.last4
#         response = customer.update_subscription({:plan => "premium"})
      else
        customer = Stripe::Customer.retrieve(stripe_id)
        customer.card = stripe_card_token
        customer.save
#         self.last_4_digits = customer.active_card.last4
      end

      self.stripe_id = customer.id
      self.stripe_card_token = nil
#     elsif last_4_digits_changed?
#       self.last_4_digits = last_4_digits_was
#     end
    end
  end
end
