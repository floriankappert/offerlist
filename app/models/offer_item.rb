class OfferItem < ActiveRecord::Base
  belongs_to :offer

  acts_as_list :scope => :offer

  attr_accessible :offer_id, :description, :title, :gross, :net, :position, :vat, :vatrate

  validates :title, :presence => {:message => 'Please enter a title'}
  validates :gross, :presence => {:message => 'Please enter the gross price'}
  validates :net, :presence => {:message => 'Please enter the net price'}
  validates :vat, :presence => {:message => 'Please enter the vat'}
  validates :vatrate, :presence => {:message => 'Please enter the vat rate'}
  validates :position, :presence => {:message => 'Please enter the offeritem position'}

  before_save :check_sums

  private

  def check_sums 

  	if (gross == net + vat)
  		true
  	else
  		errors.add(:gross, "Gross not equal to net + vat") 
  		false
  	end
  end
end