class Amount < ActiveRecord::Base
  has_many :additions

  def dollar_value
    "$#{cents/100}"
  end
end
