class Offer < ActiveRecord::Base
  attr_accessible :company, :offer_number, :title, :project_name, :offer_date, :offer_due_date, :text, :draft

  validates :company, :presence => {:message => 'Please enter the company name'}
  validates :title, :presence => {:message => 'Please enter the title of your offer'}
  validates :offer_date, :presence => {:message => 'Please enter the offer date'}

  before_create :set_offer_number

  before_create :default_values
  
  def set_offer_number
  	val = Offer.maximum(:offer_number)
    val = 0 if val.nil?
    self.offer_number = val + 1
  end  

  def default_values
    self.draft ||= 1
  end

  scope :draft, -> { where(:draft => true)}

  self.per_page = 20
end
