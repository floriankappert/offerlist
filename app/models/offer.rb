class Offer < ActiveRecord::Base
  attr_accessible :company, :offer_number
	
  before_create :set_offer_number

  def set_offer_number
  	val = Offer.maximum(:offer_number)
    val = 0 if val.nil?
    self.offer_number = val + 1
  end  
end
