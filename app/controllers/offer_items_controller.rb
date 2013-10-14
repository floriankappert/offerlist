class OfferItemsController < ApplicationController
  def create
  	@offer = Offer.find(params[:offer_id])
  	@offer_item = @offer.offer_items.new(params[:offer_item])
    render "offers/show" unless @offer_item.save
  end

  def edit
    @offer = Offer.find(params[:offer_id])
    @offer_item = OfferItem.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:offer_id])
    @offer_item = OfferItem.find(params[:id])
    @offer_item.update_attributes(params[:offer_item])     
  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @offer_item = @offer.offer_items.find(params[:id])
    @offer_item.destroy
  end

  def sort 
    params[:offer_item_wrapper].each_with_index do |id, index|
      OfferItem.update_all({position: index+1}, {id: id})
    end
    @offer_items = OfferItem.where(:id => params[:offer_item_wrapper]).all
  end

end