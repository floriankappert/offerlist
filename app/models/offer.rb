class Offer < ActiveRecord::Base
  attr_accessible :company, :offer_number, :title, :project_name, :offer_date, :offer_due_date, :text

  has_many :offer_items, dependent: :destroy

  self.per_page = 20

  validates :company, :presence => {:message => 'Please enter the company name'}
  validates :title, :presence => {:message => 'Please enter the title of your offer'}
  validates :offer_date, :presence => {:message => 'Please enter the offer date'}

  default_scope where(:data_deleted => false)  
  scope :draft, -> { where(:draft => true)}

  before_create :set_offer_number

  def offer_total
    offer_items.sum('gross')
  end

  def activate
     self.draft = false
     return true if save
     false
  end

  private
    def set_offer_number
      val = Offer.unscoped.maximum(:offer_number) || 0
      self.offer_number = val + 1
    end  
end
