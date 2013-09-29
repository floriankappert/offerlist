class Offer < ActiveRecord::Base
  attr_accessible :company, :offer_number, :title, :project_name, :offer_date, :offer_due_date, :text, :draft
	
  before_create :set_offer_number

  def set_offer_number
  	val = Offer.maximum(:offer_number)
    val = 0 if val.nil?
    self.offer_number = val + 1
  end  

  scope :draft, -> { where(:draft => true)}

  self.per_page = 3
end
